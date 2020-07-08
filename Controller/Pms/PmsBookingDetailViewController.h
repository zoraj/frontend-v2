#pragma once

#include <QObject>
#include <QDebug>

#include "Model/PmsNoteEnteteModel.h"

#include "Service/NoteService.h"

class PmsBookingDetailViewController : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(PmsChambreListModel *chambreListModel MEMBER chambreListModel)
private:
    //QList<PmsChambreModel> rooms;
    //PmsChambreListModel *chambreListModel;
    //void loadData();
public:
    explicit PmsBookingDetailViewController(QObject *parent = nullptr);

    Q_INVOKABLE
    void validateButtonClicked(PmsNoteEnteteModel *headerNote);
signals:

public slots:
};

#pragma once
