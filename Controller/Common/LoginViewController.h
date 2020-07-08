#pragma once

#include <QObject>
#include <QQmlContext>
#include "Application/ApplicationManager.h"
#include "Util/Constant.h"
#include "Service/UserService.h"

#include "Controller/Pms/PmsBookingDetailViewController.h"
/*
#include "Model/PmsCalendrierNettoyageModel.h"
#include "Model/PmsCategorieChambreModel.h"
#include "Model/PmsChambreModel.h"
#include "Model/PmsDisponibiliteModel.h"
#include "Model/PmsEncaissementModel.h"
#include "Model/PmsNoteDetailModel.h"
#include "Model/PmsNoteEnteteModel.h"
#include "Model/PmsPrescripteurModel.h"
#include "Model/PmsProductModel.h"
#include "Model/PmsTypeChambreModel.h"
#include "Model/MmcModeEncaissementModel.h"
#include "Model/MmcClientModel.h"
#include "Model/MmcFamilleCaModel.h"
#include "Model/MmcSousFamilleCaModel.h"
#include "Model/DeviceModel.h"
#include "Model/MmcSegmentClientModel.h"
#include "Model/MmcUserModel.h"
#include "Model/MmcTypeClientModel.h"
#include "Model/MmcSiteModel.h"
#include "Model/PosSiropParfumCategorieModel.h"
#include "Model/PosProductModel.h"
#include "Model/PosNoteEnteteModel.h"
#include "Model/PosNoteDetailModel.h"
#include "Model/PosActiviteModel.h"
#include "Model/PosProductGroupModel.h"
#include "Model/PosEncaissementModel.h"
#include "Model/PosCurrentNoteModel.h"

#include "Service/SectionService.h"
#include "Service/ProductService.h"
#include "Service/CashingService.h"
#include "Service/ClientService.h"
#include "Service/RoomService.h"
#include "Service/NoteService.h"
#include "Service/CleaningScheduleService.h"
#include "Service/FamilyService.h"
#include "Controller/Pos/PosNewNoteViewController.h"
#include "Cache/PosActiviteCache.h"
#include "Cache/PosProductCache.h"
#include "Cache/PosProductGroupCache.h"
#include "Cache/PosSiropParfumCategorieCache.h"
#include "Cache/PosEncaissementCache.h"
#include "Cache/PosNoteDetailCache.h"
#include "Cache/PosNoteEnteteCache.h"
#include "Cache/MmcClientCache.h"
#include "Cache/MmcFamilleCaCache.h"
#include "Cache/MmcModeEncaissementCache.h"
#include "Cache/MmcSegmentClientCache.h"
#include "Cache/MmcSiteCache.h"
#include "Cache/MmcSousFamilleCaCache.h"
#include "Cache/MmcUserCache.h"
#include "Cache/MmcTypeClientCache.h"
#include "Cache/PmsCalendrierNettoyageCache.h"
#include "Cache/PmsCategorieChambreCache.h"
#include "Cache/PmsChambreCache.h"
#include "Cache/PmsDisponibiliteCache.h"
#include "Cache/PmsEncaissementCache.h"
#include "Cache/PmsNoteDetailCache.h"
#include "Cache/PmsNoteEnteteCache.h"
#include "Cache/PmsPrescripteurCache.h"
#include "Cache/PmsProductCache.h"
#include "Cache/PmsTypeChambreCache.h"
#include "Controller/Pos/PosTablePlanViewController.h"
#include "Controller/Pos/PosPendingNoteViewController.h"
#include "Controller/Pos/PosProductViewController.h"
#include "Controller/Pms/PmsPlanningViewController.h"
*/
class LoginViewController : public QObject
{
    Q_OBJECT
private:
    void checkCredentials(const QString &login, const QString &password);
    void registerControllers(Constant::Module module);
    void registerCurrentUser(MmcUserModel *user);
    //void retrieveAndCacheCommonData();
    //void retrieveAndCacheData(Constant::Module module);
public:
    explicit LoginViewController(QObject *parent = nullptr);

    Q_INVOKABLE
    void loginButtonClicked(const QString &login, const QString &password);
    //Q_INVOKABLE
    //void moduleChoiceButtonClicked(const QString &module);

signals:
    void signinFinishedWithResult(const QString &result);
public slots:

};

