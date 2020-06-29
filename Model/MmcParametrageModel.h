#pragma once

#include <QString>

struct MmcParametrageModel {
    QString cle;
    QString valeur;

    MmcParametrageModel(){}
    MmcParametrageModel(const QString &cle, const QString &valeur) {
        this->cle = cle;
        this->valeur = valeur;
    }
};

