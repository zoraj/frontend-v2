#include "ClientService.h"

ClientService::ClientService()
{

}

void ClientService::getAll()
{
    HttpRequest request { fullPath(Constant::WS_METHOD_CLIENT),
                    "GET",
                    QJsonObject(),
                    apiKey,
                    bearerToken};
    executeRequest(request);
}

void ClientService::callback(const QByteArray &response, int status)
{
    if (BaseService::isRestMethod(Constant::WS_METHOD_CLIENT))
        emit getAllFinished(response, status);
}
