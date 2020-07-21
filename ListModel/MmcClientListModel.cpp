#include "MmcClientListModel.h"

const int MmcClientListModel::IdRole                    = Qt::UserRole + 1;
const int MmcClientListModel::CodeRole                  = Qt::UserRole + 2;
const int MmcClientListModel::CompteComptableRole       = Qt::UserRole + 3;
const int MmcClientListModel::CompteAuxiliaireRole      = Qt::UserRole + 4;
const int MmcClientListModel::NumBadgeRole              = Qt::UserRole + 5;
const int MmcClientListModel::NomRole                   = Qt::UserRole + 6;
const int MmcClientListModel::PrenomRole                = Qt::UserRole + 7;
const int MmcClientListModel::AdresseRole               = Qt::UserRole + 8;
const int MmcClientListModel::VilleRole                 = Qt::UserRole + 9;
const int MmcClientListModel::PaysRole                  = Qt::UserRole + 10;
const int MmcClientListModel::CodePostalRole            = Qt::UserRole + 11;
const int MmcClientListModel::TelephoneRole             = Qt::UserRole + 12;
const int MmcClientListModel::MobileRole                = Qt::UserRole + 13;
const int MmcClientListModel::EmailRole                 = Qt::UserRole + 14;
const int MmcClientListModel::NationaliteRole           = Qt::UserRole + 15;
const int MmcClientListModel::QualiteRole               = Qt::UserRole + 16;
const int MmcClientListModel::MmcTypeClientIdRole       = Qt::UserRole + 17;
const int MmcClientListModel::PmsPrescripteurIdRole     = Qt::UserRole + 18;
const int MmcClientListModel::MmcSegmentClientIdRole    = Qt::UserRole + 19;
const int MmcClientListModel::PmsSocieteIdRole          = Qt::UserRole + 20;
const int MmcClientListModel::PmsTypeCompteClientIdRole = Qt::UserRole + 21;
const int MmcClientListModel::PmsTarifIdRole            = Qt::UserRole + 22;
const int MmcClientListModel::MaxPassageRole            = Qt::UserRole + 23;
const int MmcClientListModel::PasswordRole              = Qt::UserRole + 24;

MmcClientListModel::MmcClientListModel(QObject *parent) : QAbstractListModel(parent)
{

}

MmcClientListModel::~MmcClientListModel()
{

}

QVariant MmcClientListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant(); // Return Null variant if index is invalid
    if (index.row() > (m_items.size()-1) )
        return QVariant();

    MmcClientModel mmcClientModel = m_items.at(index.row());
    switch (role) {
    case Qt::DisplayRole: // The default display role now displays the first name as well
    case IdRole:
        return QVariant::fromValue(mmcClientModel.id);
    case CodeRole:
        return QVariant::fromValue(mmcClientModel.code);
    case CompteComptableRole:
        return QVariant::fromValue(mmcClientModel.compteComptable);
    case CompteAuxiliaireRole:
        return QVariant::fromValue(mmcClientModel.compteAuxiliaire);
    case NumBadgeRole:
        return QVariant::fromValue(mmcClientModel.numBadge);
    case NomRole:
        return QVariant::fromValue(mmcClientModel.nom);
    case PrenomRole:
        return QVariant::fromValue(mmcClientModel.prenom);
    case AdresseRole:
        return QVariant::fromValue(mmcClientModel.adresse);
    case VilleRole:
        return QVariant::fromValue(mmcClientModel.ville);
    case PaysRole:
        return QVariant::fromValue(mmcClientModel.pays);
    case CodePostalRole:
        return QVariant::fromValue(mmcClientModel.codePostal);
    case TelephoneRole:
        return QVariant::fromValue(mmcClientModel.telephone);
    case MobileRole:
        return QVariant::fromValue(mmcClientModel.mobile);
    case EmailRole:
        return QVariant::fromValue(mmcClientModel.email);
    case NationaliteRole:
        return QVariant::fromValue(mmcClientModel.nationalite);
    case QualiteRole:
        return QVariant::fromValue(mmcClientModel.qualite);
    case MmcTypeClientIdRole:
        return QVariant::fromValue(mmcClientModel.mmcTypeClientId);
    case PmsPrescripteurIdRole:
        return QVariant::fromValue(mmcClientModel.pmsPrescripteurId);
    case MmcSegmentClientIdRole:
        return QVariant::fromValue(mmcClientModel.mmcSegmentClientId);
    case PmsSocieteIdRole:
        return QVariant::fromValue(mmcClientModel.pmsSocieteId);
    case PmsTypeCompteClientIdRole:
        return QVariant::fromValue(mmcClientModel.pmsTypeCompteClientId);
    case PmsTarifIdRole:
        return QVariant::fromValue(mmcClientModel.pmsTarifId);
    case MaxPassageRole:
        return QVariant::fromValue(mmcClientModel.maxPassage);
    case PasswordRole:
        return QVariant::fromValue(mmcClientModel.password);
    default:
        return QVariant();
    }
}

int MmcClientListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
     return m_items.size();
}

QHash<int, QByteArray> MmcClientListModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles.insert(IdRole, QByteArray("id"));
    roles.insert(CodeRole, QByteArray("code"));
    roles.insert(CompteComptableRole, QByteArray("compteComptable"));
    roles.insert(CompteAuxiliaireRole, QByteArray("compteAuxiliaire"));
    roles.insert(NumBadgeRole, QByteArray("numBadge"));
    roles.insert(NomRole, QByteArray("nom"));
    roles.insert(PrenomRole, QByteArray("prenom"));
    roles.insert(AdresseRole, QByteArray("adresse"));
    roles.insert(VilleRole, QByteArray("ville"));
    roles.insert(PaysRole, QByteArray("pays"));
    roles.insert(CodePostalRole, QByteArray("codePostal"));
    roles.insert(TelephoneRole, QByteArray("telephone"));
    roles.insert(MobileRole, QByteArray("mobile"));
    roles.insert(EmailRole, QByteArray("email"));
    roles.insert(NationaliteRole, QByteArray("nationalite"));
    roles.insert(QualiteRole, QByteArray("qualite"));
    roles.insert(MmcTypeClientIdRole, QByteArray("mmcTypeClientId"));
    roles.insert(PmsPrescripteurIdRole, QByteArray("pmsPrescripteurId"));
    roles.insert(MmcSegmentClientIdRole, QByteArray("mmcSegmentClientId"));
    roles.insert(PmsSocieteIdRole, QByteArray("pmsSocieteId"));
    roles.insert(PmsTypeCompteClientIdRole, QByteArray("pmsTypeCompteClientId"));
    roles.insert(PmsTarifIdRole, QByteArray("pmsTarifId"));
    roles.insert(MaxPassageRole, QByteArray("maxPassage"));
    roles.insert(PasswordRole, QByteArray("password"));

    return roles;
}

void MmcClientListModel::setClients(const QList<MmcClientModel> &clients)
{
    listModel = clients;
    foreach (const MmcClientModel &client, clients) {
        m_items.append(client);
    }
}

