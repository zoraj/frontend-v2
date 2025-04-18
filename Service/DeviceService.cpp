#include "DeviceService.h"

DeviceService::DeviceService()
{

}

void DeviceService::checkCodeConfirmation(const QString &code)
{
    QString url = Constant::WS_E_URL + QString(Constant::WS_CODE_CONFIRM_NEW_DEVICE).arg(code);
    HttpRequest request { url,
                    "GET",
                    QJsonObject(),
                    apiKey,
                    bearerToken};
    executeRequest(request);
}

void DeviceService::callback(const QByteArray &response, int status)
{
    emit checkCodeConfirmationFinished(response, status);
}
