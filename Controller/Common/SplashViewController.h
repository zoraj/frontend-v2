#pragma once

#include <QObject>
#include "Application/ApplicationManager.h"

class SplashViewController : public QObject
{
    Q_OBJECT
public:
    explicit SplashViewController(QObject *parent = nullptr);
    void loadLocalSettings() const;

    Q_INVOKABLE
    void viewLoaded();
signals:
    void viewLoadedWithResult(bool result);

public slots:
};

