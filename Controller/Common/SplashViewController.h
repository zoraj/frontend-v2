#pragma once

#include <QObject>
#include "Application/ApplicationManager.h"
#include "Controller/Controller.h"

class SplashViewController : public Controller
{
    Q_OBJECT
private:
    void loadLocalSettings() const;
public:
    //explicit SplashViewController(QObject *parent = nullptr);

    Q_INVOKABLE
    void viewDidLoad() const override ;
signals:
    void viewDidLoadWithResult(bool result, QString reason) const override;

public slots:
};

