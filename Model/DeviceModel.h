#pragma once

#include <QString>
#include <QJsonObject>
#include <QJsonParseError>
#include <QJsonArray>
#include <QDebug>


struct DeviceModel
{
    int id;
    QString reference;
    QString name;
    int mmcSiteId;
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

            id = jsonObject["id"].toInt();
            reference = jsonObject["reference"].toString();
            name = jsonObject["name"].toString();
            mmcSiteId = jsonObject["name"].toInt();
            currency = jsonObject["currency"].toString();
            language = jsonObject["language"].toString();
            apiKey = jsonObject["apiKey"].toString();
        }
        else
            qDebug() << "Error parsing " << json;
    }
};

