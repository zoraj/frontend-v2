#pragma once

#include <QObject>
#include "Application/ApplicationManager.h"
#include "Service/DeviceService.h"
#include "Model/DeviceModel.h"
#include "Model/MmcParametrageModel.h"
#include "Cache/MmcParametrageCache.h"


class CodeConfirmationViewController : public QObject
{
    Q_OBJECT
private:
    void persistDeviceInfos(const DeviceModel &device);
public:
    explicit CodeConfirmationViewController(QObject *parent = nullptr);

    Q_INVOKABLE
    void validateCodeTriggered(const QString &code);
signals:
    void validateCodeTriggeredTerminated(bool result);
};

