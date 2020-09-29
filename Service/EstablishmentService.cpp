#include "EstablishmentService.h"

EstablishmentService::EstablishmentService()
{

}

void EstablishmentService::postSignup(const Establishment &etablishment)
{
    QJsonObject payload;
    payload.insert("ownerFirstName", etablishment.ownerFirstName);
    payload.insert("ownerLastName", etablishment.ownerLastName);
    payload.insert("name", etablishment.name);
    payload.insert("country", etablishment.country);
    payload.insert("address", etablishment.address);
    payload.insert("email", etablishment.email);
    payload.insert("type", etablishment.type);
    payload.insert("phone", etablishment.phone);
    QString url = Constant::WS_E_URL + Constant::WS_REGISTER_NEW_ESTABLISHMENT;
    HttpRequest request {url,
                "POST",
                payload,
                nullptr,
                nullptr};
    executeRequest(request);
}

// Callback
void EstablishmentService::callback(const QByteArray &response, int status)
{
    emit postSignupFinished(response, status);
}
