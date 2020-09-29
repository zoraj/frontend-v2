#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QQuickStyle>
#include <QIcon>
#include <QSslSocket>

#include "Application/ApplicationManager.h"
#include "Controller/Common/SplashViewController.h"
#include "Controller/Common/SignupViewController.h"
#include "Controller/Common/CodeConfirmationViewController.h"
#include "Controller/Common/LoginViewController.h"

#include "Model/Establishment.h"
#include "Model/PmsNoteEnteteModel.h"

void registerQmlType()
{
    qmlRegisterType<Establishment>("cloud.multimicro.mmc.frontend", 1, 0, "Establishment");
    qmlRegisterType<PmsNoteEnteteModel>("cloud.multimicro.mmc.frontend", 1, 0, "PmsNoteEnteteModel");
    //qmlRegisterType<PosNoteDetailModel>("cloud.multimicro.mmc.frontend", 1, 0, "PosNoteDetailModel");
}

int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("MMC");
    QGuiApplication::setOrganizationName("MMC");

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    qDebug() << QSslSocket::supportsSsl() << QSslSocket::sslLibraryBuildVersionString() << QSslSocket::sslLibraryVersionString();

    // UI Setup
    QIcon::setThemeName("gallery");
    QQuickStyle::setStyle("Material");

    try {
        // This is the first thing to do when we have an instance of rootContect from engine, so we could easily set context property for our view controllers
        ApplicationManager::getInstance()->getAppContext()->rootContext = engine.rootContext();

        // Register class controllers
        SplashViewController splashViewController;
        ApplicationManager::getInstance()->getAppContext()->rootContext->setContextProperty("_splashViewController", &splashViewController);
        SignupViewController signupViewController;
        ApplicationManager::getInstance()->getAppContext()->rootContext->setContextProperty("_signupViewController", &signupViewController);
        CodeConfirmationViewController codeConfirmationViewController;
        ApplicationManager::getInstance()->getAppContext()->rootContext->setContextProperty("_codeConfirmationViewController", &codeConfirmationViewController);
        LoginViewController loginViewController;
        ApplicationManager::getInstance()->getAppContext()->rootContext->setContextProperty("_loginViewController", &loginViewController);

        // Register All type
        registerQmlType();

        const QUrl url(QStringLiteral("qrc:/main.qml"));
        QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                         &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
        engine.load(url);

        return app.exec();
    } catch (const char* ex) {
        qDebug() << ex;
    }
}
