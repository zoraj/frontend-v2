#pragma once

#include <QObject>
#include <QQmlContext>
#include <QStandardPaths>
#include <QDir>
#include <QSqlDatabase>
#include <QException>

#include "Util/Constant.h"
#include "Model/MmcUserModel.h"
#include "Cache/MmcParametrageCache.h"

// Data structure
class ApplicationContext: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString apikey MEMBER apikey)

public:
    QQmlContext *rootContext;

    MmcUserModel user;
    QString language;
    QString token;
    QString apikey;
    QString dateSoftware;
    Constant::Module module;
};

// Class definition
class ApplicationManager : public QObject
{
    Q_OBJECT
private:
    static ApplicationManager *instance;
    ApplicationContext *applicationContext = nullptr;

public:
    explicit ApplicationManager(QObject *parent = nullptr);
    static ApplicationManager *getInstance();

    void initCacheSystem();
    void loadSetting();

    ApplicationContext *getAppContext();
};

