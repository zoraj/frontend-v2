#pragma once

#include <QString>
#include <QJsonObject>
#include <QJsonParseError>
#include <QJsonArray>
#include <QDebug>

struct MmcClientModel
{
    int id;
    QString code;
    QString compteComptable;
    QString compteAuxiliaire;
    QString numBadge;
    QString nom;
    QString prenom;
    QString adresse;
    QString ville;
    QString pays;
    QString codePostal;
    QString telephone;
    QString mobile;
    QString email;
    QString nationalite;
    QString qualite;
    int mmcTypeClientId;
    int pmsPrescripteurId;
    int mmcSegmentClientId;
    int pmsSocieteId;
    int pmsTypeCompteClientId;
    int pmsTarifId;
    int maxPassage;
    QString password;

    MmcClientModel() {

    }
    MmcClientModel(const QByteArray &json) {
        QJsonParseError error;

        QJsonDocument jsonDoc= QJsonDocument::fromJson(json, &error);
        if (error.error == QJsonParseError::NoError) {
            QJsonObject jsonObject = jsonDoc.object();

            id = jsonObject["id"].toInt();
            numBadge = jsonObject["numBadge"].toString();
            code = jsonObject["code"].toString();
            nom = jsonObject["nom"].toString();
            prenom = jsonObject["prenom"].toString();
        }
        else
            qDebug() << "Error parsing " << json;
    }

    MmcClientModel(const QJsonObject &jsonObject) {
        id = jsonObject["id"].toInt();
        numBadge = jsonObject["numBadge"].toString();
        code = jsonObject["code"].toString();
        nom = jsonObject["nom"].toString();
        prenom = jsonObject["prenom"].toString();
    }


    static QList<MmcClientModel> fromArray(const QByteArray &json)
    {
        QList<MmcClientModel> clients;
        QJsonParseError error;

        QJsonDocument jsonDoc = QJsonDocument::fromJson(json, &error);
        if (error.error == QJsonParseError::NoError) {
            QJsonArray jsonArray = jsonDoc.array();
            foreach (const  QJsonValue &value, jsonArray) {
                QJsonObject jsonObject = value.toObject();
                MmcClientModel client(jsonObject);
                clients.append(client);
            }
        }
        return clients;
    }
};

