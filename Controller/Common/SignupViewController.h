#pragma once

#include <QObject>
#include <QDebug>

#include "Model/EtablissementModel.h"
#include "Service/EstablishmentService.h"

class SignupViewController : public QObject
{
    Q_OBJECT
public:
    explicit SignupViewController(QObject *parent = nullptr);

    Q_INVOKABLE
    void validateButtonClicked(EtablissementModel *etablissement);
signals:
    void signupCallback(bool result);
public slots:
};

