#pragma once

#include "BaseService.h"

class ClientService: public BaseService
{
 Q_OBJECT
public:
    ClientService();
    void getAll();

    void callback(const QByteArray &response, int status) override;
signals:
    void getAllFinished(const QByteArray &response, int status);
};

