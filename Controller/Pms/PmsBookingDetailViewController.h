#pragma once

#include <QObject>
#include <QDebug>

#include "Model/PmsNoteEnteteModel.h"
#include "Model/PmsTypeChambreModel.h"
#include "Model/PmsChambreModel.h"
#include "Model/MmcClientModel.h"

#include "ListModel/MmcClientListModel.h"

#include "Service/NoteService.h"
#include "Service/RoomService.h"
#include "Service/ClientService.h"

class PmsBookingDetailViewController : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(MmcClientListModel* clientListModel READ clientListModel WRITE setCashingModeList NOTIFY cashingModeListChanged)
    Q_PROPERTY(MmcClientListModel* clientListModel MEMBER clientListModel)
private:
    int clientId;
    PmsNoteEnteteModel *headerNote = nullptr;
    QList<PmsTypeChambreModel> roomsType;
    QList<PmsChambreModel> rooms;
    QList<MmcClientModel> clients;
    //PmsChambreListModel *chambreListModel;

    MmcClientListModel *clientListModel;
    void loadData();
    void persistData();
public:
    explicit PmsBookingDetailViewController(QObject *parent = nullptr);

    Q_INVOKABLE
    void validateButtonClicked(PmsNoteEnteteModel *pHeaderNote);
    Q_INVOKABLE
    void componentUILoaded();
    Q_INVOKABLE
    void setClient(int index);
signals:
    void sigRefreshUI(PmsNoteEnteteModel *currentHeader);
    void validateButtonFinished(bool result);
public slots:

};

#pragma once
