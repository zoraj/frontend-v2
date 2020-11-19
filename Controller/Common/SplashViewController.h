#pragma once

#include <QObject>
#include "Application/ApplicationManager.h"
#include "Controller/BaseController.h"

class SplashViewController : public BaseController
{
    Q_OBJECT
private:
    void loadLocalSettings() const;
public:
    //explicit SplashViewController(QObject *parent = nullptr);

    Q_INVOKABLE
    void viewDidLoad() const override ;
    Q_INVOKABLE
    void viewDidUnload() const override;

signals:
    void viewDidLoadWithResult(bool result, QString reason) const override;

public slots:
};

