#include "SignupViewController.h"

SignupViewController::SignupViewController(QObject *parent) : QObject(parent)
{

}

void SignupViewController::validateButtonClicked(EtablissementModel *etablissement)
{
    if (etablissement != nullptr) {
        EstablishmentService *establishmentService = new EstablishmentService();
        qDebug() << etablissement->name;
        establishmentService->postSignup(*etablissement);
        QObject::connect(establishmentService, &EstablishmentService::postSignupFinished, [=] (const QByteArray &response, const int status){
            if (status == Constant::HttpStatusCode::OK) {
                qDebug() << response;
            }
            signupCallback(status == Constant::HttpStatusCode::OK);
            establishmentService->deleteLater();
        });
    }
}
