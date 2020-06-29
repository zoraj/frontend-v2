#pragma once

#include <QObject>
#include <QJsonObject>
#include <QJsonParseError>
#include <QDebug>

struct MmcUserModel
{
    int id;
    QString login;
    QString password;
    QString salt;
    QString firstname;
    QString lastname;
    QString userType;
    QString moduleAuthorized;
    QString token;
    MmcUserModel() {

    }
    MmcUserModel(const QByteArray &json) {
        QJsonParseError error;

        QJsonDocument jsonDoc= QJsonDocument::fromJson(json, &error);
        if (error.error == QJsonParseError::NoError) {
            QJsonObject jsonObject = jsonDoc.object();

            id = jsonObject["id"].toInt();
            login = jsonObject["login"].toString();
            firstname = jsonObject["firstname"].toString();
            lastname = jsonObject["lastname"].toString();
            userType = jsonObject["userType"].toString();
            moduleAuthorized = jsonObject["moduleAuthorized"].toString();
            token = jsonObject["token"].toString();
        }
        else
            qDebug() << "Error parsing " << json;
    }
};

