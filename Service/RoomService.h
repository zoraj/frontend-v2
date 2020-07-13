#pragma once

#include "BaseService.h"

class RoomService: public BaseService
{
    Q_OBJECT
public:
    RoomService();

    //void getRoom();
    //void postRoom(const QString &libelle, const int numeroEtage);
    //void getRoomCategories();
    //void postRoomCategories(const QString &libelle, const QString &reference);
    void getRoomTypes();
    //void postRoomTypes(const QString &libelle, const QString &reference);

    void callback(const QByteArray &response, int status) override;
signals:
    //void getRoomFinished(const QByteArray &response, int status);
    //void getRoomCategoriesFinished(const QByteArray &response, int status);
    void getRoomTypesFinished(const QByteArray &response, int status);
};

