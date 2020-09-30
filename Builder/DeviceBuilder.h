#pragma once

#include <QJsonObject>
#include <QJsonParseError>
#include <QJsonArray>
#include <QDebug>

#include "Builder.h"
#include "Model/Device.h"


class DeviceBuilder: public Builder {
private:
    Device *device;
public:
    DeviceBuilder() {
        device = new Device();
    }
    ~DeviceBuilder() {
        delete device;
        qDebug() << "AEAEZA";
    }
    void create(const QByteArray &json) const override {
        QJsonParseError error;

        QJsonDocument jsonDoc= QJsonDocument::fromJson(json, &error);
        if (error.error == QJsonParseError::NoError) {
            QJsonObject jsonObject = jsonDoc.object();

            device->uuid = jsonObject["uuid"].toString();
            device->name = jsonObject["name"].toString();
            device->mmcSiteId = jsonObject["siteCode"].toString();
            device->currency = jsonObject["currency"].toString();
            device->language = jsonObject["language"].toString();
            device->apiKey = jsonObject["apiKey"].toString();
        }
    }

    Device *get() const override  {
        return device;
    }
};
