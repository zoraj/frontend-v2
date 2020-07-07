#pragma once
#include "BaseService.h"

class DeviceService: public BaseService
{
    Q_OBJECT
  public:
      DeviceService();
      void checkCodeConfirmation( const QString &code);

      void callback(const QByteArray &response, int status) override;
  signals:
      void checkCodeConfirmationFinished(const QByteArray &response, int status);
};

