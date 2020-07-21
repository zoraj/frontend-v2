#pragma once

#include <QObject>
#include <QAbstractListModel>
#include "Model/MmcClientModel.h"

class MmcClientListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit MmcClientListModel(QObject *parent);
    ~MmcClientListModel();
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QHash<int, QByteArray> roleNames() const;
    void setClients(const QList<MmcClientModel> &clients);
    QList<MmcClientModel> listModel;

signals:

public slots:


private:
    QList<MmcClientModel> m_items;
    static const int IdRole;
    static const int CodeRole;
    static const int CompteComptableRole;
    static const int CompteAuxiliaireRole;
    static const int NumBadgeRole;
    static const int NomRole;
    static const int PrenomRole;
    static const int AdresseRole;
    static const int VilleRole;
    static const int PaysRole;
    static const int CodePostalRole;
    static const int TelephoneRole;
    static const int MobileRole;
    static const int EmailRole;
    static const int NationaliteRole;
    static const int QualiteRole;
    static const int MmcTypeClientIdRole;
    static const int PmsPrescripteurIdRole;
    static const int MmcSegmentClientIdRole;
    static const int PmsSocieteIdRole;
    static const int PmsTypeCompteClientIdRole;
    static const int PmsTarifIdRole;
    static const int MaxPassageRole;
    static const int PasswordRole;
};

