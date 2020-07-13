#include "PmsBookingDetailViewController.h"

// Public Methods
PmsBookingDetailViewController::PmsBookingDetailViewController(QObject *parent) : QObject(parent)
{
    //chambreListModel = new PmsChambreListModel(parent);
}



// Private Methods
void PmsBookingDetailViewController::loadData()
{
    auto roomService = new RoomService();
    roomService->getRoomTypes();
    QObject::connect(roomService, &RoomService::getRoomTypesFinished, [=] (const QByteArray &response, const int status){
        if (status == Constant::HttpStatusCode::OK) {
            //emit signinSuccess(user.moduleAuthorized);
            roomsType = PmsTypeChambreModel::fromArray(response);
            //chambreListModel->setRooms(rooms);
            qDebug() << "Type room fetched and it contains " << roomsType.length();
        }
        else {
            qDebug() << "Something went wrong. Bad credentials.";
        }
        roomService->deleteLater();
    });
}

// Event definition
void PmsBookingDetailViewController::validateButtonClicked(PmsNoteEnteteModel *headerNote)
{
    //loadData();
    auto noteService = new NoteService();
    noteService->postNotePmsHeader(*headerNote);

    QObject::connect(noteService, &NoteService::postNotePmsHeaderFinished, [=] (const QByteArray &response, const int status){
        if (status == Constant::HttpStatusCode::OK) {
            //rooms = PmsChambreModel::fromArray(response);
            //chambreListModel->setRooms(rooms);
        }
        noteService->deleteLater();
    });
}
