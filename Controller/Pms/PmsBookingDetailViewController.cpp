#include "PmsBookingDetailViewController.h"

// Public Methods
PmsBookingDetailViewController::PmsBookingDetailViewController(QObject *parent) : QObject(parent)
{
    //chambreListModel = new PmsChambreListModel(parent);
    typeChambreListModel = new PmsTypeChambreListModel(parent);
}

// Private Methods
void PmsBookingDetailViewController::persistData()
{
    auto noteService = new NoteService();
    noteService->postNotePmsHeader(*headerNote);

    QObject::connect(noteService, &NoteService::postNotePmsHeaderFinished, [=] (const QByteArray &response, const int status){
        if (status == Constant::HttpStatusCode::OK) {
            //rooms = PmsChambreModel::fromArray(response);
            //chambreListModel->setRooms(rooms);
        }
        noteService->deleteLater();
        emit sigValidateButtonFinished(status == Constant::HttpStatusCode::OK);
    });
}

void PmsBookingDetailViewController::loadData()
{
    // Load client account list
    auto clientService = new ClientService();
    clientService->getAll();
    QObject::connect(clientService, &ClientService::getAllFinished, [=] (const QByteArray &response, const int status){
        if (status == Constant::HttpStatusCode::OK) {
            clients = MmcClientModel::fromArray(response);
            qDebug() << "We've got " << clients.length() << " clients";

            clientListModel = new MmcClientListModel(nullptr);
            clientListModel->setClients(clients);
        }
    });

    // Load room types
    auto roomService = new RoomService();
    roomService->getRoomTypes();
    QObject::connect(roomService, &RoomService::getRoomTypesFinished, [=] (const QByteArray &response, const int status){
        if (status == Constant::HttpStatusCode::OK) {
            //emit signinSuccess(user.moduleAuthorized);
            roomsType = PmsTypeChambreModel::fromArray(response);
            typeChambreListModel->setRoomTypes(roomsType);

            qDebug() << "Type room fetched and it contains " << roomsType.length();
        }
        else {
            qDebug() << "Something went wrong. Bad credentials.";
        }
        roomService->deleteLater();
    });
}

// Event definition
void PmsBookingDetailViewController::setClient(int index)
{
    if (headerNote != nullptr) {
        clientId = clients.at(index).id;
        headerNote->mmcClientName = clients.at(index).nom;

        emit sigReloadUI(headerNote);
    }
}

void PmsBookingDetailViewController::componentCompleted()
{
    headerNote = new PmsNoteEnteteModel();
    loadData();    
}

void PmsBookingDetailViewController::validateButtonClicked(PmsNoteEnteteModel *pHeaderNote)
{
    headerNote = pHeaderNote;
    headerNote->mmcClientId = clientId;

    persistData();
}
