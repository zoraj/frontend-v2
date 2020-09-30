#pragma once

#include <QObject>
#include "Application/ApplicationManager.h"
#include "Service/DeviceService.h"
#include "Builder/DeviceBuilder.h"
#include "Model/Device.h"
#include "Model/MmcParametrageModel.h"
#include "Cache/MmcParametrageCache.h"


class CodeConfirmationViewController : public QObject
{
    Q_OBJECT
private:
    void persistDeviceInfos(const Device &device);
public:
    explicit CodeConfirmationViewController(QObject *parent = nullptr);

    Q_INVOKABLE
    void validateCodeTriggered(const QString &code);
signals:
    void validateCodeTriggeredTerminated(bool result);
};

