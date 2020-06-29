#pragma once

#include <QObject>

class SplashViewController : public QObject
{
    Q_OBJECT
public:
    explicit SplashViewController(QObject *parent = nullptr);
    void loadLocalSettings();
signals:

public slots:
};

