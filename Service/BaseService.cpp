#include "BaseService.h"

BaseService::BaseService(QObject *parent): QObject(parent)
{
    apiKey = APP_CONTEXT_API_KEY;
    bearerToken = APP_CONTEXT_TOKEN;
}

QString BaseService::fullPath(const QString &method) const
{
    return Constant::WS_ROOT_URL + method;
}

void BaseService::setMethodName(const QString &method)
{
    this->methodName = method;
}

QString BaseService::getMethodName() const
{
    return this->methodName;
}

void BaseService::executeRequest(const HttpRequest &request)
{
    timer.start();
    qDebug() << "************************************************************************";
    qDebug() << "Http request: " << request.url;
    this->setMethodName(request.url);
    HttpRequestInput input(request.url, request.method);
    input.apiKey = request.apiKey;
    input.bearerToken = request.bearerToken;

    if (request.method == "POST") {
        QJsonDocument doc(request.payload);
        QByteArray s = doc.toJson();
        input.payload = s;
        qDebug() << "With payload: " << s ;
    }

    HttpUtil *worker = new HttpUtil(this); // TODO Memory leaks
    connect(worker, SIGNAL(onExecutionFinished(HttpUtil*)), this, SLOT(handleResult(HttpUtil*)));
    worker->execute(&input);
}

bool BaseService::isRestMethod(const QString &method) const
{
    return  fullPath(method) == this->getMethodName();
}


void BaseService::handleResult(HttpUtil *httpUtil)
{
    QByteArray payload;
    int status;
    int elapsedTime = timer.elapsed();
    QByteArray response = httpUtil->response;
     status = httpUtil->httpStatusCode;

    qDebug() << "Http request result: " << elapsedTime << " milliseconds - " << response.size() << " bytes" ;
    qDebug() << response;
    callback(response, status);
}

void BaseService::callback(const QByteArray &response, int status)
{
    qDebug() << "Http status code : " << status;
    qDebug() <<  response << endl;
}
