#pragma once

#include <QString>
#include <QJsonObject>
#include <QJsonParseError>
#include <QJsonArray>
#include <QDebug>


class PmsVenteComptantModel: public QObject
{
    Q_OBJECT

public:
    QString nomNote;
    int segmentId;
    int clientId;
    double remise;
    double commission;

    PmsVenteComptantModel() {
        nomNote = "TETETETE";
        segmentId = 1;
        clientId = 5;
        remise = 0;
        commission = 0;
    }

    PmsVenteComptantModel(const PmsVenteComptantModel &){

    }

};

