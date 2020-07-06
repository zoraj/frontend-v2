#pragma once
#include "BaseService.h"
#include "Model/EtablissementModel.h"

class EstablishmentService: public BaseService
{
    Q_OBJECT
  public:
      EstablishmentService();
      void postSignup(const EtablissementModel &etablishment);

      void callback(const QByteArray &response, int status) override;
  signals:
      void postSignupFinished(const QByteArray &response, int status);
};

