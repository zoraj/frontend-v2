#pragma once

#include <QObject>
#include <QDebug>

#include "Model/PmsNoteEnteteModel.h"
#include "Model/PmsTypeChambreModel.h"
#include "Model/PmsChambreModel.h"

#include "Service/NoteService.h"
#include "Service/RoomService.h"

class PmsBookingDetailViewController : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(PmsChambreListModel *chambreListModel MEMBER chambreListModel)
private:
    QList<PmsTypeChambreModel> roomsType;
    QList<PmsChambreModel> rooms;
    //PmsChambreListModel *chambreListModel;
    void loadData();
public:
    explicit PmsBookingDetailViewController(QObject *parent = nullptr);

    Q_INVOKABLE
    void validateButtonClicked(PmsNoteEnteteModel *headerNote);
signals:

public slots:
};

#pragma once
