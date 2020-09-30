#include "SignupViewController.h"

SignupViewController::SignupViewController(QObject *parent) : QObject(parent)
{

}

void SignupViewController::validateButtonClicked(Establishment *establishment)
{
    if (establishment) {
        EstablishmentService *establishmentService = new EstablishmentService();
        establishmentService->postSignup(establishment);
        QObject::connect(establishmentService, &EstablishmentService::postSignupFinished, [=] (const QByteArray &response, const int status){
            if (status == Constant::HttpStatusCode::OK) {
                qDebug() << response;
            }
            establishmentService->deleteLater();

            emit signupCallback(status == Constant::HttpStatusCode::OK);
        });
    }
}
