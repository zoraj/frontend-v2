#include "CodeConfirmationViewController.h"

CodeConfirmationViewController::CodeConfirmationViewController(QObject *parent) : QObject(parent)
{

}

void CodeConfirmationViewController::validateCodeTriggered(const QString &code)
{
    auto deviceService = new DeviceService();
    deviceService->checkCodeConfirmation(code);
    QObject::connect(deviceService, &DeviceService::checkCodeConfirmationFinished, [=] (const QByteArray &response, const int status){
        if (status == Constant::HttpStatusCode::OK) {
            DeviceModel device = DeviceModel(response);
            qDebug() << "SUCCESS "<< device.apiKey;
            persistDeviceInfos(device);
        }
        else {
            qDebug() << "Something went wrong. " + response;
        }

        emit validateCodeTriggeredTerminated(status == Constant::HttpStatusCode::OK);
        deviceService->deleteLater();
    });
}

void CodeConfirmationViewController::persistDeviceInfos(const DeviceModel &device)
{
    QList<MmcParametrageModel> settings;
    MmcParametrageModel setting = MmcParametrageModel("UUID", device.uuid);
    settings.append(setting);
    setting = MmcParametrageModel("API-KEY", device.apiKey);
    settings.append(setting);
    setting = MmcParametrageModel("NAME", device.name);
    settings.append(setting);
    setting = MmcParametrageModel("SITE-ID", device.mmcSiteId);
    settings.append(setting);
    setting = MmcParametrageModel("LANGUAGE", device.language);
    settings.append(setting);
    setting = MmcParametrageModel("CURRENCY", device.currency);
    settings.append(setting);
    MmcParametrageCache::persist(settings);

    ApplicationManager::getInstance()->getAppContext()->apikey = device.apiKey;
}
