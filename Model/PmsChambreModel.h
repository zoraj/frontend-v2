#pragma once

#include <QString>
#include <QJsonObject>
#include <QJsonParseError>
#include <QJsonArray>
#include <QDebug>

struct PmsChambreModel
{
    int id;
    QString numeroChambre;
    int numeroEtage;
    QString etatChambre;
    int pmsTypeChambreId;

    PmsChambreModel() {

    }
    PmsChambreModel(const QByteArray &json) {
        QJsonParseError error;

        QJsonDocument jsonDoc= QJsonDocument::fromJson(json, &error);
        if (error.error == QJsonParseError::NoError) {
            QJsonObject jsonObject = jsonDoc.object();

            id = jsonObject["id"].toInt();
            numeroChambre = jsonObject["numeroChambre"].toString();
            numeroEtage = jsonObject["numeroEtage"].toInt();
            etatChambre = jsonObject["etatChambre"].toString();
            pmsTypeChambreId = jsonObject["pmsTypeChambreId"].toInt();
        }
        else
            qDebug() << "Error parsing " << json;
    }

    PmsChambreModel(const QJsonObject &jsonObject) {
        id = jsonObject["id"].toInt();
        numeroChambre = jsonObject["numeroChambre"].toString();
        numeroEtage = jsonObject["numeroEtage"].toInt();
        etatChambre = jsonObject["etatChambre"].toString();
        pmsTypeChambreId = jsonObject["pmsTypeChambreId"].toInt();
    }


    static QList<PmsChambreModel> fromArray(const QByteArray &json)
    {
        QList<PmsChambreModel> chambres;
        QJsonParseError error;

        QJsonDocument jsonDoc = QJsonDocument::fromJson(json, &error);
        if (error.error == QJsonParseError::NoError) {
            QJsonArray jsonArray = jsonDoc.array();
            foreach (const  QJsonValue &value, jsonArray) {
                QJsonObject jsonObject = value.toObject();
                PmsChambreModel chambre(jsonObject);
                chambres.append(chambre);
            }
        }
        return chambres;
    }

};

