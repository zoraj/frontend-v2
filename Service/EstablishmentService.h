#pragma once
#include "BaseService.h"
#include "Model/Establishment.h"

class EstablishmentService: public BaseService
{
    Q_OBJECT
  public:
      EstablishmentService();
      void postSignup(Establishment *etablishment);

      void callback(const QByteArray &response, int status) override;
  signals:
      void postSignupFinished(const QByteArray &response, int status);
};

