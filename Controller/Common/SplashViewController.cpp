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
    if (ApplicationManager::getInstance()->getAppContext()->apikey.isNull()) {
        emit viewLoadedWithResult("NO_APIKEY");
    }
}



