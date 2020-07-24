#pragma once

#include <QString>
#include <QJsonObject>
#include <QJsonParseError>
#include <QJsonArray>
#include <QDebug>


struct DeviceModel
{
    QString uuid;
    QString name;
    QString mmcSiteId;
    QString currency;
    QString language;
    QString apiKey;

    DeviceModel() {

    }
    DeviceModel(const QByteArray &json) {
        QJsonParseError error;

        QJsonDocument jsonDoc= QJsonDocument::fromJson(json, &error);
        if (error.error == QJsonParseError::NoError) {
            QJsonObject jsonObject = jsonDoc.object();

            uuid = jsonObject["uuid"].toString();
            name = jsonObject["name"].toString();
            mmcSiteId = jsonObject["siteCode"].toString();
            currency = jsonObject["currency"].toString();
            language = jsonObject["language"].toString();
            apiKey = jsonObject["apiKey"].toString();
        }
        else
            qDebug() << "Error parsing " << json;
    }
};

