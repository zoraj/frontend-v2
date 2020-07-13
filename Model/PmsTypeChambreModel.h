#pragma once

#include <QString>
#include <QJsonObject>
#include <QJsonParseError>
#include <QJsonArray>
#include <QDebug>

class PmsTypeChambreModel: public QObject
{
    int id;
    QString libelle;
    QString reference;
    int salon;
    int pmsCategorieChambreId;
    int persMin;
    int persMax;
    int nbEnfant;

public:
    PmsTypeChambreModel() {}
    PmsTypeChambreModel(const PmsTypeChambreModel&){}

    PmsTypeChambreModel(const QByteArray &json) {
        QJsonParseError error;

        QJsonDocument jsonDoc= QJsonDocument::fromJson(json, &error);
        if (error.error == QJsonParseError::NoError) {
            QJsonObject jsonObject = jsonDoc.object();

            id = jsonObject["id"].toInt();
            libelle = jsonObject["libelle"].toString();
            reference = jsonObject["reference"].toString();
            salon = jsonObject["salon"].toInt();
            pmsCategorieChambreId = jsonObject["pmsCategorieChambreId"].toInt();
            persMin = jsonObject["persMin"].toInt();
            persMax = jsonObject["persMax"].toInt();
            nbEnfant = jsonObject["nbEnfant"].toInt();
        }
        else
            qDebug() << "Error parsing " << json;
    }

    PmsTypeChambreModel(const QJsonObject &jsonObject) {
        id = jsonObject["id"].toInt();
        libelle = jsonObject["libelle"].toString();
        reference = jsonObject["reference"].toString();
        salon = jsonObject["salon"].toInt();
        pmsCategorieChambreId = jsonObject["pmsCategorieChambreId"].toInt();
        persMin = jsonObject["persMin"].toInt();
        persMax = jsonObject["persMax"].toInt();
        nbEnfant = jsonObject["nbEnfant"].toInt();
    }


    static QList<PmsTypeChambreModel> fromArray(const QByteArray &json)
    {
        QList<PmsTypeChambreModel> typeChambres;
        QJsonParseError error;

        QJsonDocument jsonDoc = QJsonDocument::fromJson(json, &error);
        if (error.error == QJsonParseError::NoError) {
            QJsonArray jsonArray = jsonDoc.array();
            foreach (const  QJsonValue &value, jsonArray) {
                QJsonObject jsonObject = value.toObject();
                PmsTypeChambreModel typeChambre(jsonObject);
                typeChambres.append(typeChambre);
            }
        }
        return typeChambres;
    }
};

