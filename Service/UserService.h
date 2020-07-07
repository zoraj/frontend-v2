#pragma once
#include "BaseService.h"
#include "Util/Constant.h"

class UserService : public BaseService
{
    Q_OBJECT
public:
    UserService();
    void postUserCredentials(const QString &login, const QString &password);

    void callback(const QByteArray &response, int status) override;

signals:
    void postUserCredentialsFinished(const QByteArray &response, int status);
};

