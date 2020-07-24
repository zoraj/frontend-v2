#include "SplashViewController.h"

// Class Initialisation
SplashViewController::SplashViewController(QObject *parent) : QObject(parent)
{

}

// Private methods
void SplashViewController::loadLocalSettings() const
{
    ApplicationManager::getInstance()->initCacheSystem();
    ApplicationManager::getInstance()->loadSetting();
}

// Public methods


// UI Events
void SplashViewController::viewLoaded()
{
    loadLocalSettings();
    bool hasAPIKeyAndUUIDDevice = !ApplicationManager::getInstance()->getAppContext()->apikey.isNull() && !ApplicationManager::getInstance()->getAppContext()->deviceUuid.isNull();
    emit viewLoadedWithResult(hasAPIKeyAndUUIDDevice);
}



