#include "LoginViewController.h"

LoginViewController::LoginViewController(QObject *parent) : QObject(parent)
{

}




/*

// TODO: Move this method to a better place, it overcharges the actual controller
void LoginViewController::retrieveAndCacheCommonData()
{
    // Famille de CA
    emit authenticationActivityLog("Chargement des données. Récupération des familles de CA...");
    FamilyService *familyService = new FamilyService();
    familyService->getFamilies();
    QObject::connect(familyService, &FamilyService::getFamiliesFinished, [=] (const QByteArray &response, const int status) {
        if (status == Constant::HttpStatusCode::OK) {
            QList<MmcFamilleCaModel> family = MmcFamilleCaModel::fromArray(response);
            MmcFamilleCaCache::persist(family);
        }
        else if (status == Constant::HttpStatusCode::NotFound) {
            emit authenticationActivityLog("Famille de C.A non configuré.");
        }
        else {
            emit authenticationActivityLog("Something went wrong. Families list can't be fetched");
        }
        familyService->deleteLater();
    });

    //  SUB FAMILY
    emit authenticationActivityLog("Chargement des données. Récupération des sous familles de CA...");
    FamilyService *sFamilyService = new FamilyService();
    sFamilyService->getSubFamily();
    QObject::connect(sFamilyService, &FamilyService::getSubFamilyFinished, [=] (const QByteArray &response, const int status) {
        if (status == Constant::HttpStatusCode::OK) {
            QList<MmcSousFamilleCaModel> subFamily = MmcSousFamilleCaModel::fromArray(response);
            MmcSousfamilleCaCache::persist(subFamily);
        }
        else if (status == Constant::HttpStatusCode::NotFound) {
            emit authenticationActivityLog("Sous Famille de C.A non configuré.");
        }
        else {
            emit authenticationActivityLog("Something went wrong. Subfamilies list can't be fetched");
        }
        sFamilyService->deleteLater();
    });

    //CASHING MODE
    emit authenticationActivityLog("Chargement des données. Récupération des modes d'encaissements...");
    CashingService *cashingService = new CashingService();
    cashingService->getCashingMode();
    QObject::connect(cashingService, &CashingService::getCashingModeFinished, [=] (const QByteArray &response, const int status) {
        if (status == Constant::HttpStatusCode::OK) {
            QList<MmcModeEncaissementModel> cashingMode = MmcModeEncaissementModel::fromArray(response);
            MmcModeEncaissementCache::persist(cashingMode);
        }
        else if (status == Constant::HttpStatusCode::NotFound) {
            emit authenticationActivityLog("Mode d'encaissement non configuré.");
        }
        else {
            qDebug() << "Something went wrong. Product list can't be fetched";
        }
    });

    // CLIENT TYPE

    ClientService *clientService = new ClientService();
    clientService->getTypeClient();
    QObject::connect(clientService, &ClientService::getClientFinished, [=] (const QByteArray &response, const int status) {
        if (status == Constant::HttpStatusCode::OK) {
            QList<MmcTypeClientModel> typeClient = MmcTypeClientModel::fromArray(response);
            MmcTypeClientCache::persist(typeClient);
        }
        else {
            qDebug() << "Something went wrong. Activities list can't be fetched";
        }
    });

    // PRESCRIPTEUR
    clientService->getPrescripteur();
    QObject::connect(clientService, &ClientService::getPrescripteurFinished, [=] (const QByteArray &response, const int status) {
        if (status == Constant::HttpStatusCode::OK) {
            QList<PmsPrescripteurModel> prescripteur = PmsPrescripteurModel::fromArray(response);
            PmsPrescripteurCache::persist(prescripteur);
        }
        else {
            qDebug() << "Something went wrong. Activities list can't be fetched";
        }
    });

    // CLIENT SEGMENT
    clientService->getSegmentClient();
    QObject::connect(clientService, &ClientService::getSegmentClientFinished, [=] (const QByteArray &response, const int status) {
        if (status == Constant::HttpStatusCode::OK) {
            QList<MmcSegmentClientModel> segmentClient = MmcSegmentClientModel::fromArray(response);
            MmcSegmentClientCache::persist(segmentClient);
        }
        else {
            qDebug() << "Something went wrong. Activities list can't be fetched";
        }
    });

    // CLIENT
    clientService->getClient();
    QObject::connect(clientService, &ClientService::getClientFinished, [=] (const QByteArray &response, const int status) {
        if (status == Constant::HttpStatusCode::OK) {
            QList<MmcClientModel> client = MmcClientModel::fromArray(response);
            MmcClientCache::persist(client);
        }
        else {
            qDebug() << "Something went wrong. Activities list can't be fetched";
        }
        clientService->deleteLater();
    });





    //CASHING POS
    cashingService->getCashingPos();
    QObject::connect(cashingService, &CashingService::getCashingPosFinished, [=] (const QByteArray &response, const int status) {
        if (status == Constant::HttpStatusCode::OK) {
            QList<PosEncaissementModel> cashing = PosEncaissementModel::fromArray(response);
            PosEncaissementCache::persist(cashing);
        }
        else {
            qDebug() << "Something went wrong. Product list can't be fetched";
        }
        cashingService->deleteLater();
    });


    //NOTE HEADER POS
    NoteService *noteService = new NoteService();
    noteService->getNotePosHeader();
    QObject::connect(noteService, &NoteService::getNotePosHeaderFinished, [=] (const QByteArray &response, const int status) {
        if (status == Constant::HttpStatusCode::OK) {
            QList<PosNoteEnteteModel> noteEntete = PosNoteEnteteModel::fromArray(response);
            PosNoteEnteteCache::persist(noteEntete);
        }
        else {
            qDebug() << "Something went wrong. Product list can't be fetched";
        }
    });

    //NOTE DETAILS POS
    noteService->getNotePosDetails();
    QObject::connect(noteService, &NoteService::getNotePosDetailsFinished, [=] (const QByteArray &response, const int status) {
        if (status == Constant::HttpStatusCode::OK) {
            QList<PosNoteDetailModel> noteDetail = PosNoteDetailModel::fromArray(response);
            PosNoteDetailCache::persist(noteDetail);
        }
        else {
            qDebug() << "Something went wrong. Product list can't be fetched";
        }
        noteService->deleteLater();
    });
    */

    /*



        // SIRUP PERFUME
        ProductService *productSPService = new ProductService();
        productSPService->getPosSirupParfume();
        QObject::connect(productSPService, &ProductService::getPosSirupParfumeFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<PosSiropParfumCategorieModel> siropParfums = PosSiropParfumCategorieModel::fromArray(response);
                PosSiropParfumCategorieCache::persist(siropParfums);
            }
            else {
                qDebug() << "Something went wrong. Syrup perfume can't be fetched";
            }
            productSPService->deleteLater();
        });


        */
        /*
        // SITE
        sectionService->getSites();
        QObject::connect(sectionService, &SectionService::getSitesFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<MmcSiteModel> sites = MmcSiteModel::fromArray(response);
                MmcSiteCache::persist(sites);
            }
            else {
                qDebug() << "Something went wrong. Sites list can't be fetched";
            }
        });

    }
    else if (moduleIndex == Constant::Module::RECEP) {

        //CASHING PMS
        cashingService->getCashingPms();
        QObject::connect(cashingService, &CashingService::getCashingPmsFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<PmsEncaissementModel> cashing = PmsEncaissementModel::fromArray(response);
                PmsEncaissementCache::persist(cashing);
            }
            else {
                qDebug() << "Something went wrong. Product list can't be fetched";
            }
            cashingService->deleteLater();
        });

        //NOTE HEADER PMS
        cashingService->getCashingPms();
        QObject::connect(cashingService, &CashingService::getCashingPmsFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<PmsEncaissementModel> cashing = PmsEncaissementModel::fromArray(response);
                PmsEncaissementCache::persist(cashing);
            }
            else {
                qDebug() << "Something went wrong. Product list can't be fetched";
            }
            cashingService->deleteLater();
        });

        //NOTE DETAILS PMS
        cashingService->getCashingPms();
        QObject::connect(cashingService, &CashingService::getCashingPmsFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<PmsEncaissementModel> cashing = PmsEncaissementModel::fromArray(response);
                PmsEncaissementCache::persist(cashing);
            }
            else {
                qDebug() << "Something went wrong. Product list can't be fetched";
            }
            cashingService->deleteLater();
        });

        //NOTE HEADER PMS
        NoteService *noteService = new NoteService();
        noteService->getNotePmsHeader();
        QObject::connect(noteService, &NoteService::getNotePmsHeaderFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<PmsNoteEnteteModel> noteEntete = PmsNoteEnteteModel::fromArray(response);
                PmsNoteEnteteCache::persist(noteEntete);
            }
            else {
                qDebug() << "Something went wrong. Product list can't be fetched";
            }
        });

        //NOTE DETAILS PMS
        noteService->getNotePmsDetails();
        QObject::connect(noteService, &NoteService::getNotePmsDetailsFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<PmsNoteDetailModel> noteDetail = PmsNoteDetailModel::fromArray(response);
                PmsNoteDetailCache::persist(noteDetail);
            }
            else {
                qDebug() << "Something went wrong. Product list can't be fetched";
            }
            noteService->deleteLater();
        });
        */
    /*
    }
    else if (moduleIndex == Constant::Module::RESA) {

    }
    else if (moduleIndex == Constant::Module::HOUSEKEEPING) {

        //NOTE DETAILS PMS
        CleaningScheduleService *cleaningScheduleService = new CleaningScheduleService();
        cleaningScheduleService->getCleaningSchedule();
        QObject::connect(cleaningScheduleService, &CleaningScheduleService::getCleaningScheduleFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<PmsCalendrierNettoyageModel> calendrierNettoyage = PmsCalendrierNettoyageModel::fromArray(response);
                PmsCalendrierNettoyageCache::persist(calendrierNettoyage);
            }
            else {
                qDebug() << "Something went wrong. Product list can't be fetched";
            }
            cleaningScheduleService->deleteLater();
        });

    }
    else if (moduleIndex == Constant::Module::POS_COLLECTIVITE) {

    }
}

void LoginViewController::retrieveAndCacheData(Constant::Module module)
{
    switch (module) {
    case Constant::Module::POS_TRADITIONAL: {
        // ACTIVITY
        emit authenticationActivityLog("Chargement des données. Récupération des activités...");
        SectionService *sectionService = new SectionService();
        sectionService->getActivities();
        QObject::connect(sectionService, &SectionService::getActivitiesFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<PosActiviteModel> activites = PosActiviteModel::fromArray(response);
                PosActiviteCache::persist(activites);
            }
            else if (status == Constant::HttpStatusCode::NotFound) {
                emit authenticationActivityLog("Activité non configurée.");
            }
            else {
                qDebug() << "Something went wrong. Activities list can't be fetched";
            }
            sectionService->deleteLater();
        });
        // PRODUCT GROUP
        emit authenticationActivityLog("Chargement des données. Récupération des groupes de prestations...");
        ProductService *productGroupService = new ProductService();
        productGroupService->getProductGroups();
        QObject::connect(productGroupService, &ProductService::getProductGroupsFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<PosProductGroupModel> products = PosProductGroupModel::fromArray(response);
                PosProductGroupCache::persist(products);
            }
            else if (status == Constant::HttpStatusCode::NotFound) {
                emit authenticationActivityLog("Groupe de prestation non configurée.");
            }
            else {
                qDebug() << "Something went wrong. Product group list can't be fetched";
            }
            productGroupService->deleteLater();

        });

        // PRODUCT POS
        emit authenticationActivityLog("Chargement des données. Récupération des prestations...");
        ProductService *productService = new ProductService();
        productService->getPosProducts();
        QObject::connect(productService, &ProductService::getPosProductsFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<PosProductModel> products = PosProductModel::fromArray(response);
                PosProductCache::persist(products);
            }
            else if (status == Constant::HttpStatusCode::NotFound) {
                emit authenticationActivityLog("Prestation non configurée.");
            }
            else {
                qDebug() << "Something went wrong. Product list can't be fetched";
            }
            productService->deleteLater();
        });
    }
    break;
    case Constant::Module::RESA:
        break;
    case Constant::Module::RECEP: {
        //ROOM CATEGORIES GET-ALL
        auto roomCategorieService = new RoomService();
        roomCategorieService->getRoomCategories();
        QObject::connect(roomCategorieService, &RoomService::getRoomCategoriesFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<PmsCategorieChambreModel> categorieChambre = PmsCategorieChambreModel::fromArray(response);
                PmsCategorieChambreCache::persist(categorieChambre);
            }
            else {
                qDebug() << "Something went wrong. Room categories list can't be fetched";
            }
            roomCategorieService->deleteLater();
        });

        //ROOM TYPE GET-ALL
        auto roomTypeService = new RoomService();
        roomTypeService->getRoomTypes();
        QObject::connect(roomTypeService, &RoomService::getRoomTypesFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<PmsTypeChambreModel> typeChambre = PmsTypeChambreModel::fromArray(response);
                PmsTypeChambreCache::persist(typeChambre);
            }
            else {
                qDebug() << "Something went wrong. Room type list can't be fetched";
            }
            roomTypeService->deleteLater();
        });

        //ROOM GET-ALL
        auto roomService = new RoomService();
        roomService->getRoom();
        QObject::connect(roomService, &RoomService::getRoomFinished, [=] (const QByteArray &response, const int status) {
            if (status == Constant::HttpStatusCode::OK) {
                QList<PmsChambreModel> rooms = PmsChambreModel::fromArray(response);
                PmsChambreCache::persist(rooms);
            }
            else {
                qDebug() << "Something went wrong. Room list can't be fetched";
            }
            roomService->deleteLater();
        });

    }
        break;
    case Constant::Module::HOUSEKEEPING:
        break;
    case Constant::Module::POS_COLLECTIVITE:
        break;
    case Constant::Module::Unknown:
        break;
    }
}
*/

void LoginViewController::loadData(Constant::Module module)
{
    switch (module) {
    case Constant::Module::POS_TRADITIONAL: {
        // POS Should be cached for online usage
        }
        break;
    case Constant::Module::PMS: {

        }
    case Constant::Module::HOUSEKEEPING:
        break;
    case Constant::Module::RECEP: {
        break;
        }
    case Constant::RESA:
        break;
    case Constant::Module::POS_COLLECTIVITE:
        break;

    case Constant::Module::Unknown:
        break;
        }
}

void LoginViewController::registerControllers(Constant::Module module)
{
    switch (module) {
    case Constant::Module::POS_TRADITIONAL: {
        /*
        auto posNewNoteViewController = new PosNewNoteViewController();
        ApplicationManager::getInstance()->getAppContext()->rootContext->setContextProperty("_posNewNoteViewController", posNewNoteViewController);

        auto posTablePlanViewController = new PosTablePlanViewController();
        ApplicationManager::getInstance()->getAppContext()->rootContext->setContextProperty("_posTablePlanViewController", posTablePlanViewController);

        auto posPendingNoteViewController = new PosPendingNoteViewController();
        ApplicationManager::getInstance()->getAppContext()->rootContext->setContextProperty("_posPendingNoteViewController", posPendingNoteViewController);

        auto posProductViewController = new PosProductViewController();
        ApplicationManager::getInstance()->getAppContext()->rootContext->setContextProperty("_posProductViewController", posProductViewController);
        */
    }
        break;
    case Constant::Module::PMS: {
        auto pmsBookingDetailViewController = new PmsBookingDetailViewController();
        ApplicationManager::getInstance()->getAppContext()->rootContext->setContextProperty("_pmsBookingDetailViewController", pmsBookingDetailViewController);
        break;
    }
    case Constant::Module::HOUSEKEEPING:
        break;
    case Constant::Module::RECEP: {
        break;
    }
    case Constant::RESA:
        break;
    case Constant::Module::POS_COLLECTIVITE:
        break;

    case Constant::Module::Unknown:
        break;
    }
}

void LoginViewController::registerCurrentUser(MmcUserModel *user)
{
    ApplicationManager::getInstance()->getAppContext()->user = user;
    ApplicationManager::getInstance()->getAppContext()->token = user->token;
}

void LoginViewController::checkCredentials(const QString &login, const QString &password)
{
    auto userService = new UserService();
    userService->postUserCredentials(login, password);
    QObject::connect(userService, &UserService::postUserCredentialsFinished, [=] (const QByteArray &response, const int status){
        if (status == Constant::HttpStatusCode::OK) {

            MmcUserModel user(response);
            registerCurrentUser(&user);
            registerControllers(Constant::PMS);
            // Retrieve recent data from the cloud
            //retrieveAndCacheCommonData();

            qDebug() << "Welcome back " << user.lastname << " " << user.firstname;
            emit signinFinishedWithResult("OK");
        }
        else {
            qDebug() << "Something went wrong. Bad credentials.";
            QString s = QString::fromStdString(response.toStdString());
            emit signinFinishedWithResult(s + " - Status code: " + QString::number(status));
        }
        userService->deleteLater();
    });
}

// Event Starting bloc
void LoginViewController::loginButtonClicked(const QString &login, const QString &password)
{
    // Check credentials
    checkCredentials(login, password);
}
/*
void LoginViewController::moduleChoiceButtonClicked(const QString &module)
{
    if (module == "POS_TRADITIONAL") {
        retrieveAndCacheData(Constant::Module::POS_TRADITIONAL);
        registerControllers(Constant::Module::POS_TRADITIONAL);
        emit signinSuccess("POS_TRADITIONAL");
    }
    else if (module == "RECEP") {
        retrieveAndCacheData(Constant::Module::RECEP);
        registerControllers(Constant::Module::RECEP);
        emit signinSuccess("RECEP");
    }
    else if (module == "RESA") {
        retrieveAndCacheData(Constant::Module::RESA);
        registerControllers(Constant::Module::RESA);
        emit signinSuccess("RESA");
    }
}

*/


