#pragma once

#include <QString>
#include <QJsonObject>
#include <QJsonParseError>
#include <QJsonArray>
#include <QDebug>



class PmsNoteEnteteModel: public QObject
{
    Q_OBJECT
    Q_PROPERTY(int id MEMBER id)
    Q_PROPERTY(QString dateArrivee MEMBER dateArrivee)
    Q_PROPERTY(QString dateDepart MEMBER dateDepart)
    Q_PROPERTY(QString dateOption MEMBER dateOption)
    Q_PROPERTY(QString description MEMBER description)
    Q_PROPERTY(int nbPax MEMBER nbPax)
    Q_PROPERTY(int nbChambre MEMBER nbChambre)
    Q_PROPERTY(int nbEnfant MEMBER nbEnfant)
    Q_PROPERTY(int mmcClientId MEMBER mmcClientId)
    Q_PROPERTY(QString mmcClientName MEMBER mmcClientName)
    Q_PROPERTY(QString nomNote MEMBER nomNote)
    Q_PROPERTY(QString numeroReservation MEMBER numeroReservation)
    Q_PROPERTY(QString posteUuid MEMBER posteUuid)
    Q_PROPERTY(int brigade MEMBER brigade)
    Q_PROPERTY(QString dateNote MEMBER dateNote)
    Q_PROPERTY(QString reservationType MEMBER reservationType)
    Q_PROPERTY(QString dateAnnulation MEMBER dateAnnulation)
    Q_PROPERTY(QString origine MEMBER origine)

public:
    int id;
    QString dateArrivee;
    QString dateDepart;
    QString dateOption;
    QString description;
    int nbPax;
    int nbChambre;
    int nbEnfant;
    int mmcClientId;
    QString mmcClientName; // Not in the payload, only needed for UI
    QString nomNote;
    QString numeroReservation;
    QString posteUuid;
    int brigade;
    QString dateNote;
    QString reservationType;
    QString dateAnnulation;
    QString origine;


    PmsNoteEnteteModel() {}
    PmsNoteEnteteModel(const PmsNoteEnteteModel&); // This is need as we got an error for using static method if not. See https://stackoverflow.com/questions/31264984/c-compiler-error-c2280-attempting-to-reference-a-deleted-function-in-visual

    PmsNoteEnteteModel(const QByteArray &json) {
        QJsonParseError error;

        QJsonDocument jsonDoc= QJsonDocument::fromJson(json, &error);
        if (error.error == QJsonParseError::NoError) {
            QJsonObject jsonObject = jsonDoc.object();

            id = jsonObject["id"].toInt();
            dateArrivee = jsonObject["dateArrivee"].toString();
            dateDepart = jsonObject["dateDepart"].toString();
            nbChambre = jsonObject["nbChambre"].toInt();
            nbEnfant = jsonObject["nbEnfant"].toInt();
            mmcClientId = jsonObject["mmcClientId"].toInt();
        }
        else
            qDebug() << "Error parsing " << json;
    }

    PmsNoteEnteteModel(const QJsonObject &jsonObject) {
        id = jsonObject["id"].toInt();
        dateArrivee = jsonObject["dateArrivee"].toString();
        dateDepart = jsonObject["dateDepart"].toString();
        nbChambre = jsonObject["nbChambre"].toInt();
        nbEnfant = jsonObject["nbEnfant"].toInt();
        mmcClientId = jsonObject["mmcClientId"].toInt();
    }


    static QList<PmsNoteEnteteModel> fromArray(const QByteArray &json)
    {
        QList<PmsNoteEnteteModel> pmsNoteEntetes;
        QJsonParseError error;

        QJsonDocument jsonDoc = QJsonDocument::fromJson(json, &error);
        if (error.error == QJsonParseError::NoError) {
            QJsonArray jsonArray = jsonDoc.array();
            foreach (const  QJsonValue &value, jsonArray) {
                QJsonObject jsonObject = value.toObject();
                PmsNoteEnteteModel pmsNoteEntete(jsonObject);
                //TODO pmsNoteEntetes.append(pmsNoteEntete);
            }
        }
        return pmsNoteEntetes;
    }/**/
};

/*
struct PmsNoteEnteteModel
{
    int id;
    QString dateArrivee;
    QString dateDepart;
    QString dateOption;
    QString description;
    int nbPax;
    int nbChambre;
    int nbEnfant;
    int mmcClientId;
    QString nomNote;
    int numeroReservation;
    QString posteUuid;
    int brigade;
    QString dateNote;
    QString reservationType;
    QString dateAnnulation;
    QString origine;

    PmsNoteEnteteModel() {

    }

    PmsNoteEnteteModel(const QByteArray &json) {
        QJsonParseError error;

        QJsonDocument jsonDoc= QJsonDocument::fromJson(json, &error);
        if (error.error == QJsonParseError::NoError) {
            QJsonObject jsonObject = jsonDoc.object();

            id = jsonObject["id"].toInt();
            dateArrivee = jsonObject["dateArrivee"].toString();
            dateDepart = jsonObject["dateDepart"].toString();
            nbChambre = jsonObject["nbChambre"].toInt();
            nbEnfant = jsonObject["nbEnfant"].toInt();
            mmcClientId = jsonObject["mmcClientId"].toInt();
        }
        else
            qDebug() << "Error parsing " << json;
    }

    PmsNoteEnteteModel(const QJsonObject &jsonObject) {
        id = jsonObject["id"].toInt();
        dateArrivee = jsonObject["dateArrivee"].toString();
        dateDepart = jsonObject["dateDepart"].toString();
        nbChambre = jsonObject["nbChambre"].toInt();
        nbEnfant = jsonObject["nbEnfant"].toInt();
        mmcClientId = jsonObject["mmcClientId"].toInt();
    }


    static QList<PmsNoteEnteteModel> fromArray(const QByteArray &json)
    {
        QList<PmsNoteEnteteModel> pmsNoteEntetes;
        QJsonParseError error;

        QJsonDocument jsonDoc = QJsonDocument::fromJson(json, &error);
        if (error.error == QJsonParseError::NoError) {
            QJsonArray jsonArray = jsonDoc.array();
            foreach (const  QJsonValue &value, jsonArray) {
                QJsonObject jsonObject = value.toObject();
                PmsNoteEnteteModel pmsNoteEntete(jsonObject);
                pmsNoteEntetes.append(pmsNoteEntete);
            }
        }
        return pmsNoteEntetes;
    }
};
*/

