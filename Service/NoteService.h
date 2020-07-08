#pragma once

#include "BaseService.h"
#include "Model/PmsNoteEnteteModel.h"

class NoteService: public BaseService
{
   Q_OBJECT
public:
    NoteService();

    //void getNotePosDetails();
    //void postNotePosDetails(const int posNoteEnteteId, const int posPrestationId, const double posPrestationPrix, const int qte);
    //void getNotePosHeader();
    //void postNotePosHeader(const int numTable, const int mmcClientId);
    //void getNotePmsDetails();
    //void postNotePmsDetails(const int pmsNoteEnteteId, const int pmsPrestationId, const int quantite, const int montant);
    //void getNotePmsHeader();
    void postNotePmsHeader(const PmsNoteEnteteModel &headerNote);

    void callback(const QByteArray &response, int status) override;
signals:
    //void getNotePosDetailsFinished(const QByteArray &response, int status);
    //void getNotePosHeaderFinished(const QByteArray &response, int status);
    //void getNotePmsDetailsFinished(const QByteArray &response, int status);
    //void getNotePmsHeaderFinished(const QByteArray &response, int status);
    void postNotePmsHeaderFinished(const QByteArray &response, int status);

};

