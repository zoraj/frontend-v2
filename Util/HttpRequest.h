#pragma once

#include <QString>
#include <QJsonObject>

struct HttpRequest {
    QString url;
    QString method;
    QJsonObject payload;
    QString apiKey;
    QString bearerToken;    
};

