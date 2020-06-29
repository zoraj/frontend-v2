#include "HttpUtil.h"

HttpRequestInput::HttpRequestInput() {
    initialize();
}

HttpRequestInput::HttpRequestInput(QString v_url_str, QString v_http_method) {
    initialize();
    urlStr = v_url_str;
    httpMethod = v_http_method;
}

void HttpRequestInput::initialize() {
    varLayout = NOT_SET;
    urlStr = "";
    payload = nullptr;
    apiKey = "";
}

void HttpRequestInput::addVar(QString key, QString value) {
    vars[key] = value;
}

void HttpRequestInput::addFile(QString variable_name, QString local_filename, QString request_filename, QString mime_type) {
    HttpRequestInputFileElement file;
    file.variable_name = variable_name;
    file.local_filename = local_filename;
    file.request_filename = request_filename;
    file.mime_type = mime_type;
    files.append(file);
}


HttpUtil::HttpUtil(QObject *parent)
    : QObject(parent), manager(nullptr)
{
    qsrand(QDateTime::currentDateTime().toTime_t());

    manager = new QNetworkAccessManager(this);
    connect(manager, SIGNAL(finished(QNetworkReply*)), this, SLOT(onManagerFinished(QNetworkReply*)));
}

QString HttpUtil::httpAttributeEncode(QString attribute_name, QString input) {
    // result structure follows RFC 5987
    bool need_utf_encoding = false;
    QString result = "";
    QByteArray input_c = input.toLocal8Bit();
    char c;
    for (int i = 0; i < input_c.length(); i++) {
        c = input_c.at(i);
        if (c == '\\' || c == '/' || c == '\0' || c < ' ' || c > '~') {
            // ignore and request utf-8 version
            need_utf_encoding = true;
        }
        else if (c == '"') {
            result += "\\\"";
        }
        else {
            result += c;
        }
    }

    if (result.length() == 0) {
        need_utf_encoding = true;
    }

    if (!need_utf_encoding) {
        // return simple version
        return QString("%1=\"%2\"").arg(attribute_name, result);
    }

    QString result_utf8 = "";
    for (int i = 0; i < input_c.length(); i++) {
        c = input_c.at(i);
        if (
            (c >= '0' && c <= '9')
            || (c >= 'A' && c <= 'Z')
            || (c >= 'a' && c <= 'z')
        ) {
            result_utf8 += c;
        }
        else {
            result_utf8 += "%" + QString::number(static_cast<unsigned char>(input_c.at(i)), 16).toUpper();
        }
    }

    // return enhanced version with UTF-8 support
    return QString("%1=\"%2\"; %1*=utf-8''%3").arg(attribute_name, result, result_utf8);
}

void HttpUtil::execute(HttpRequestInput *input) {

    QByteArray request_content = "";
    response = "";
    errorType = QNetworkReply::NoError;
    errorStr = "";

    // decide on the variable layout
    if (input->files.length() > 0) {
        input->varLayout = MULTIPART;
    }
    if (input->varLayout == NOT_SET) {
        input->varLayout = input->httpMethod == "GET" || input->httpMethod == "HEAD" ? ADDRESS : URL_ENCODED;
    }

    // prepare request content

    QString boundary = "";

    if (input->varLayout == ADDRESS || input->varLayout == URL_ENCODED) {
        // variable layout is ADDRESS or URL_ENCODED
        if (input->vars.count() > 0) {
            bool first = true;
            foreach (QString key, input->vars.keys()) {
                if (!first) {
                    request_content.append("&");
                }
                first = false;

                request_content.append(QUrl::toPercentEncoding(key));
                request_content.append("=");
                request_content.append(QUrl::toPercentEncoding(input->vars.value(key)));
            }

            if (input->varLayout == ADDRESS) {
                input->urlStr += "?" + request_content;
                request_content = "";
            }
        }
    }
    else {
        // variable layout is MULTIPART
        boundary = "__-----------------------"
            + QString::number(QDateTime::currentDateTime().toTime_t())
            + QString::number(qrand());
        QString boundary_delimiter = "--";
        QString new_line = "\r\n";

        // add variables
        foreach (QString key, input->vars.keys()) {
            // add boundary
            request_content.append(boundary_delimiter);
            request_content.append(boundary);
            request_content.append(new_line);

            // add header
            request_content.append("Content-Disposition: form-data; ");
            request_content.append(httpAttributeEncode("name", key));
            request_content.append(new_line);
            request_content.append("Content-Type: text/plain");
            request_content.append(new_line);

            // add header to body splitter
            request_content.append(new_line);

            // add variable content
            request_content.append(input->vars.value(key));
            request_content.append(new_line);
        }

        // add files
        for (QList<HttpRequestInputFileElement>::iterator file_info = input->files.begin(); file_info != input->files.end(); file_info++) {
            QFileInfo fi(file_info->local_filename);

            // ensure necessary variables are available
            if (
                file_info->local_filename == nullptr || file_info->local_filename.isEmpty()
                || file_info->variable_name == nullptr || file_info->variable_name.isEmpty()
                || !fi.exists() || !fi.isFile() || !fi.isReadable()
            ) {
                // silent abort for the current file
                continue;
            }

            QFile file(file_info->local_filename);
            if (!file.open(QIODevice::ReadOnly)) {
                // silent abort for the current file
                continue;
            }

            // ensure filename for the request
            if (file_info->request_filename == nullptr || file_info->request_filename.isEmpty()) {
                file_info->request_filename = fi.fileName();
                if (file_info->request_filename.isEmpty()) {
                    file_info->request_filename = "file";
                }
            }

            // add boundary
            request_content.append(boundary_delimiter);
            request_content.append(boundary);
            request_content.append(new_line);

            // add header
            request_content.append(QString("Content-Disposition: form-data; %1; %2").arg(
                httpAttributeEncode("name", file_info->variable_name),
                httpAttributeEncode("filename", file_info->request_filename)
            ));
            request_content.append(new_line);

            if (file_info->mime_type != nullptr && !file_info->mime_type.isEmpty()) {
                request_content.append("Content-Type: ");
                request_content.append(file_info->mime_type);
                request_content.append(new_line);
            }

            request_content.append("Content-Transfer-Encoding: binary");
            request_content.append(new_line);

            // add header to body splitter
            request_content.append(new_line);

            // add file content
            request_content.append(file.readAll());
            request_content.append(new_line);

            file.close();
        }

        // add end of body
        request_content.append(boundary_delimiter);
        request_content.append(boundary);
        request_content.append(boundary_delimiter);
    }


    // prepare connection

    QNetworkRequest request = QNetworkRequest(QUrl(input->urlStr));
    request.setRawHeader("User-Agent", "MMC Client");
    QString headerData = "Bearer " + input->bearerToken.toUtf8();
    request.setRawHeader("Authorization", headerData.toUtf8());

    if (input->varLayout == URL_ENCODED) {
        request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    }
    else if (input->varLayout == MULTIPART) {
        request.setHeader(QNetworkRequest::ContentTypeHeader, "multipart/form-data; boundary=" + boundary);
    }

    QByteArray postDataSize = QByteArray::number(input->payload.size());
    QByteArray tmp_byte;
    if (input->apiKey != "") {
        tmp_byte.insert(0, input->apiKey);
        request.setRawHeader("x-api-key",tmp_byte);
    }

    request.setRawHeader("User-Agent", "MMC Frontend");
    request.setRawHeader("X-Custom-User-Agent", "MMC");
    request.setRawHeader("Content-Type", "application/json");
    request.setRawHeader("Content-Length", postDataSize);


    if (input->httpMethod == "GET") {
        manager->get(request);
    }
    else if (input->httpMethod == "POST") {
        manager->post(request,input->payload);
    }
    else if (input->httpMethod == "PUT") {
        manager->put(request, request_content);
    }
    else if (input->httpMethod == "HEAD") {
        manager->head(request);
    }
    else if (input->httpMethod == "DELETE") {
        manager->deleteResource(request);
    }
    else {
        QBuffer buff(&request_content);
        manager->sendCustomRequest(request, input->httpMethod.toLatin1(), &buff);
    }

}

void HttpUtil::onManagerFinished(QNetworkReply *reply) {
    errorType = reply->error();

    switch (errorType) {
    case QNetworkReply::NoError:
        httpStatusCode = Constant::HttpStatusCode::OK;
        break;
    case QNetworkReply::ContentNotFoundError:
        httpStatusCode = Constant::HttpStatusCode::NotFound;
        break;
    case QNetworkReply::HostNotFoundError:
        httpStatusCode = Constant::HttpStatusCode::HostNotFound;
        break;
    default:
        httpStatusCode = Constant::HttpStatusCode::InternalServerError;
        break;
    }

    //httpStatusCode = reply->NetworkError;
    //qDebug() << "HTTP RETURN :" + QString::number(reply->error());
    if (errorType == QNetworkReply::NoError) {
        response = reply->readAll();
    }
    else {
        errorStr = reply->errorString();
        qDebug() << "Something went wrong on HttpUtil - " << errorStr;
    }

    reply->deleteLater();

    emit onExecutionFinished(this);
}

