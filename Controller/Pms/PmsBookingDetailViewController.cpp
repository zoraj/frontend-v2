#include "PmsBookingDetailViewController.h"

// Public Methods
PmsBookingDetailViewController::PmsBookingDetailViewController(QObject *parent) : QObject(parent)
{
    //chambreListModel = new PmsChambreListModel(parent);
}



/*
// Private Methods
void PmsBookingDetailViewController::loadData()
{
    auto roomService = new RoomService();
    roomService->getRoom();
    QObject::connect(roomService, &RoomService::getRoomFinished, [=] (const QByteArray &response, const int status){
        if (status == Constant::HttpStatusCode::OK) {
            //emit signinSuccess(user.moduleAuthorized);
            rooms = PmsChambreModel::fromArray(response);
            chambreListModel->setRooms(rooms);
        }
        else {
            qDebug() << "Something went wrong. Bad credentials.";
        }
        roomService->deleteLater();
    });
}
*/

// Event definition
void PmsBookingDetailViewController::validateButtonClicked(PmsNoteEnteteModel *headerNote)
{
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
