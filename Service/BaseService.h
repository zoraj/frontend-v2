#pragma once

#include <QJsonDocument>
#include <QJsonObject>
#include "Util/Util.h"
#include "Util/HttpUtil.h"
#include "Util/Constant.h"
#include "Util/HttpRequest.h"
#include "Application/ApplicationManager.h"

#define APP_CONTEXT_API_KEY ApplicationManager::getInstance()->getAppContext()->apikey
#define APP_CONTEXT_TOKEN ApplicationManager::getInstance()->getAppContext()->token


class BaseService : public QObject
{
    Q_OBJECT
private:
    QString methodName;
    QTime timer;
protected:
    QString apiKey;
    QString bearerToken;
public:
    BaseService(QObject *parent = nullptr);
    QString fullPath(const QString &method) const;
    void executeRequest(const HttpRequest &request);
    void setMethodName(const QString &method);
    QString getMethodName() const;
    bool isRestMethod(const QString &method) const;

    virtual void callback(const QByteArray &response, int status);

public slots:
    void handleResult(HttpUtil *httpUtil);

};


