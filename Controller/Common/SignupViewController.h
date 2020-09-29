#pragma once

#include <QObject>
#include <QDebug>

#include "Model/Establishment.h"
#include "Service/EstablishmentService.h"

class SignupViewController : public QObject
{
    Q_OBJECT
public:
    explicit SignupViewController(QObject *parent = nullptr);

    Q_INVOKABLE
    void validateButtonClicked(Establishment *establishment);
signals:
    void signupCallback(bool result);
public slots:
};

