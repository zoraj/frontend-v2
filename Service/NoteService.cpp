#include "NoteService.h"

NoteService::NoteService()
{

}
/*
void NoteService::getNotePosDetails()
{
    HttpRequest request { fullPath(Constant::WS_METHOD_NOTES_POS_DETAILS),
                    "GET",
                    QJsonObject(),
                    apiKey,
                    bearerToken};
    executeRequest(request);
}

void NoteService::postNotePosDetails(const int posNoteEnteteId, const int posPrestationId, const double posPrestationPrix, const int qte)
{
    QJsonObject payload;
    payload.insert("posNoteEnteteId", posNoteEnteteId);
    payload.insert("posPrestationId", posPrestationId);
    payload.insert("posPrestationPrix", posPrestationPrix);
    payload.insert("qte", qte);
    HttpRequest request { fullPath(Constant::WS_METHOD_NOTES_POS_DETAILS),
                "POST",
                payload,
                apiKey,
                bearerToken};
    executeRequest(request);
}

void NoteService::getNotePosHeader()
{
    HttpRequest request { fullPath(Constant::WS_METHOD_NOTES_POS_HEADER),
                    "GET",
                    QJsonObject(),
                    apiKey,
                    bearerToken};
    executeRequest(request);
}

void NoteService::postNotePosHeader(const int numTable, const int mmcClientId)
{
    QJsonObject payload;
    payload.insert("numTable", numTable);
    payload.insert("mmcClientId", mmcClientId);
    HttpRequest request { fullPath(Constant::WS_METHOD_NOTES_POS_HEADER),
                "POST",
                payload,
                apiKey,
                bearerToken};
    executeRequest(request);
}
void NoteService::getNotePmsDetails()
{
    HttpRequest request { fullPath(Constant::WS_METHOD_NOTES_PMS_DETAILS),
                    "GET",
                    QJsonObject(),
                    apiKey,
                    bearerToken};
    executeRequest(request);
}

void NoteService::postNotePmsDetails(const int pmsNoteEnteteId, const int pmsPrestationId, const int quantite, const int montant)
{
    QJsonObject payload;
    payload.insert("pmsNoteEnteteId", pmsNoteEnteteId);
    payload.insert("pmsPrestationId", pmsPrestationId);
    payload.insert("quantite", quantite);
    payload.insert("montant", montant);
    HttpRequest request { fullPath(Constant::WS_METHOD_NOTES_PMS_DETAILS),
                "POST",
                payload,
                apiKey,
                bearerToken};
    executeRequest(request);
}

void NoteService::getNotePmsHeader()
{
    HttpRequest request { fullPath(Constant::WS_METHOD_NOTES_PMS_HEADER),
                    "GET",
                    QJsonObject(),
                    apiKey,
                    bearerToken};
    executeRequest(request);
}
*/
void NoteService::postNotePmsHeader(const PmsNoteEnteteModel &headerNote)
{
    QJsonObject payload;
    payload.insert("dateArrivee", headerNote.dateArrivee);
    payload.insert("dateDepart", headerNote.dateDepart);
    payload.insert("nbChambre", headerNote.nbChambre);
    payload.insert("nbEnfant", headerNote.nbEnfant);
    payload.insert("mmcClientId", headerNote.mmcClientId);
    payload.insert("nbPax", headerNote.nbPax);
    payload.insert("brigade", APP_CONTEXT_BRIGADE);
    payload.insert("nom", headerNote.nomNote);
    payload.insert("reservationType", headerNote.reservationType);
    payload.insert("posteUuid", APP_CONTEXT_DEVICE_UUID);
    payload.insert("origine", "PMS");
    payload.insert("statut", "NOTE");

    HttpRequest request { fullPath(Constant::WS_METHOD_NOTES_PMS_HEADER),
                "POST",
                payload,
                apiKey,
                bearerToken};
    executeRequest(request);
}

// Callback
void NoteService::callback(const QByteArray &response, int status)
{
    /*
    if (BaseService::isRestMethod(Constant::WS_METHOD_NOTES_POS_DETAILS))
        emit getNotePosDetailsFinished(response, status);
    if (BaseService::isRestMethod(Constant::WS_METHOD_NOTES_POS_HEADER))
        emit getNotePosHeaderFinished(response, status);
    if (BaseService::isRestMethod(Constant::WS_METHOD_NOTES_PMS_DETAILS))
        emit getNotePmsDetailsFinished(response, status);
    if (BaseService::isRestMethod(Constant::WS_METHOD_NOTES_PMS_HEADER))
        emit getNotePmsHeaderFinished(response, status);
        */
    if (BaseService::isRestMethod(Constant::WS_METHOD_NOTES_PMS_HEADER))
        emit postNotePmsHeaderFinished(response, status);
}

