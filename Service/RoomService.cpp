#include "RoomService.h"

RoomService::RoomService()
{

}

/*
void RoomService::getRoom()
{
   HttpRequest request { fullPath(Constant::WS_METHOD_ROOM),
                   "GET",
                   QJsonObject(),
                   apiKey,
                   bearerToken};
   executeRequest(request);
}

void RoomService::postRoom(const QString &numeroChambre, const int numeroEtage)
{
    QJsonObject payload;
    payload.insert("numeroChambre", numeroChambre);
    payload.insert("numeroEtage", numeroEtage);
    HttpRequest request { fullPath(Constant::WS_METHOD_ROOM),
                "POST",
                payload,
                apiKey,
                bearerToken};
    executeRequest(request);
}

void RoomService::getRoomCategories()
{
   HttpRequest request { fullPath(Constant::WS_METHOD_ROOM_CATEGORIES),
                   "GET",
                   QJsonObject(),
                   apiKey,
                   bearerToken};
   executeRequest(request);
}

void RoomService::postRoomCategories(const QString &libelle, const QString &reference)
{
    QJsonObject payload;
    payload.insert("libelle", libelle);
    payload.insert("reference", reference);
    HttpRequest request { fullPath(Constant::WS_METHOD_ROOM_CATEGORIES),
                "POST",
                payload,
                apiKey,
                bearerToken};
    executeRequest(request);
}
*/
void RoomService::getRoomTypes()
{
    HttpRequest request { fullPath(Constant::WS_METHOD_ROOM_TYPES),
                    "GET",
                    QJsonObject(),
                    apiKey,
                    bearerToken};
    executeRequest(request);
}

/*
void RoomService::postRoomTypes(const QString &libelle, const QString &reference)
{
    QJsonObject payload;
    payload.insert("libelle", libelle);
    payload.insert("reference", reference);
    HttpRequest request { fullPath(Constant::WS_METHOD_ROOM_TYPES),
                "POST",
                payload,
                apiKey,
                bearerToken};
    executeRequest(request);
}
*/
void RoomService::callback(const QByteArray &response, int status)
{
    /*
    if (BaseService::isRestMethod(Constant::WS_METHOD_ROOM))
        emit getRoomFinished(response, status);
    if (BaseService::isRestMethod(Constant::WS_METHOD_ROOM_CATEGORIES))
        emit getRoomCategoriesFinished(response, status);
        */
    if (BaseService::isRestMethod(Constant::WS_METHOD_ROOM_TYPES))
        emit getRoomTypesFinished(response, status);
}
