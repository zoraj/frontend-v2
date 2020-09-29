#include "SignupViewController.h"

SignupViewController::SignupViewController(QObject *parent) : QObject(parent)
{

}

void SignupViewController::validateButtonClicked(Establishment *establishment)
{
    if (establishment != nullptr) {
        EstablishmentService *establishmentService = new EstablishmentService();
        qDebug() << establishment->name;
        establishmentService->postSignup(*establishment);
        QObject::connect(establishmentService, &EstablishmentService::postSignupFinished, [=] (const QByteArray &response, const int status){
            if (status == Constant::HttpStatusCode::OK) {
                qDebug() << response;
            }
            signupCallback(status == Constant::HttpStatusCode::OK);
            establishmentService->deleteLater();
        });
    }
}
