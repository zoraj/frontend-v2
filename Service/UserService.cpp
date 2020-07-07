#include "UserService.h"

UserService::UserService()
{

}

void UserService::postUserCredentials(const QString &login, const QString &password)
{
    QJsonObject payload;
    payload.insert("login", login);
    payload.insert("password", password);
    HttpRequest request { fullPath(Constant::WS_METHOD_LOGIN),
                "POST",
                payload,
                APP_CONTEXT_API_KEY,
                APP_CONTEXT_TOKEN};
    executeRequest(request);
}

// Callback
void UserService::callback(const QByteArray &response, int status)
{
    if (BaseService::isRestMethod(Constant::WS_METHOD_LOGIN))
        emit postUserCredentialsFinished(response, status);
}
