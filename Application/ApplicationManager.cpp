#include "ApplicationManager.h"

ApplicationManager *ApplicationManager::instance = nullptr;
ApplicationManager::ApplicationManager(QObject *parent) : QObject(parent)
{

}

ApplicationManager *ApplicationManager::getInstance()
{
    if (ApplicationManager::instance == nullptr) {
        ApplicationManager::instance = new ApplicationManager();
    }
    return ApplicationManager::instance;
}

ApplicationContext *ApplicationManager::getAppContext()
{
   if (applicationContext == nullptr) {
       applicationContext = new ApplicationContext();
   }
   return applicationContext;
}

// Cache system setup
void ApplicationManager::initCacheSystem()
{
    QDir directory(QDir::tempPath());
    QString databasePath = directory.absolutePath();
    qInfo() << "Database path : " << databasePath;
    QString databaseFile = databasePath  + "/" +  Constant::DB_CACHE;

    bool cacheExists = QFile::exists(databaseFile);

    if (!cacheExists) {
        qInfo() << "Caching database doesn't exist";
        QFile modeleDb(":/Misc/Db/" + Constant::DB_CACHE);
        bool cacheCopyStatus = modeleDb.copy(databaseFile);
        if (cacheCopyStatus) {
            qInfo() << "Copying database cache successfully";
            // Make it writable
            QFile cacheFile(databaseFile);
            cacheFile.setPermissions(QFileDevice::ReadOwner | QFileDevice::WriteOwner);
        }
        else {
            throw "Copying caching database failed." ;
        }
    }

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(databaseFile);
    try {
        db.open();
    }
    catch(QException e) {
        throw "Something went wrong while opening database cache" + QString::fromUtf8(e.what());
    }
}

void ApplicationManager::loadSetting()
{
    MmcParametrageModel setting =  MmcParametrageCache::get("API-KEY");
    applicationContext->apikey = setting.valeur;

    setting =  MmcParametrageCache::get("DATE_LOGICIELLE");
    applicationContext->dateSoftware = setting.valeur;

    qDebug() << "API-KEY " << applicationContext->apikey;
    qDebug() << "DATE_LOGICIELLE " << applicationContext->dateSoftware;

}
