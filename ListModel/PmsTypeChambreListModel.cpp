#include "PmsTypeChambreListModel.h"

const int PmsTypeChambreListModel::IdRole         = Qt::UserRole + 1;
const int PmsTypeChambreListModel::LibelleRole    = Qt::UserRole + 2;
const int PmsTypeChambreListModel::ReferenceRole  = Qt::UserRole + 3;
const int PmsTypeChambreListModel::SalonRole      = Qt::UserRole + 4;
const int PmsTypeChambreListModel::PmsCategorieChambreIdRole = Qt::UserRole + 5;
const int PmsTypeChambreListModel::PersMinRole  = Qt::UserRole + 6;
const int PmsTypeChambreListModel::PersMaxRole  = Qt::UserRole + 7;
const int PmsTypeChambreListModel::NbEnfantRole = Qt::UserRole + 8;

PmsTypeChambreListModel::PmsTypeChambreListModel(QObject *parent) : QAbstractListModel(parent)
{

}

PmsTypeChambreListModel::~PmsTypeChambreListModel()
{

}

QVariant PmsTypeChambreListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant(); // Return Null variant if index is invalid
    if (index.row() > (m_items.size()-1) )
        return QVariant();

    PmsTypeChambreModel typeChambreModel = m_items.at(index.row());
    switch (role) {
    case Qt::DisplayRole: // The default display role now displays the first name as well
    case IdRole:
        return QVariant::fromValue(typeChambreModel.id);
    case LibelleRole:
        return QVariant::fromValue(typeChambreModel.libelle);
    case ReferenceRole:
        return QVariant::fromValue(typeChambreModel.reference);
    case SalonRole:
        return QVariant::fromValue(typeChambreModel.salon);
    case PmsCategorieChambreIdRole:
        return QVariant::fromValue(typeChambreModel.pmsCategorieChambreId);
    case PersMinRole:
        return QVariant::fromValue(typeChambreModel.persMin);
    case PersMaxRole:
        return QVariant::fromValue(typeChambreModel.persMax);
    case NbEnfantRole:
        return QVariant::fromValue(typeChambreModel.nbEnfant);
    default:
        return QVariant();
    }
}

int PmsTypeChambreListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
     return m_items.size();
}

QHash<int, QByteArray> PmsTypeChambreListModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles.insert(IdRole, QByteArray("id"));
    roles.insert(LibelleRole, QByteArray("libelle"));
    roles.insert(ReferenceRole, QByteArray("reference"));
    roles.insert(SalonRole, QByteArray("salon"));
    roles.insert(PmsCategorieChambreIdRole, QByteArray("pmsCategorieChambreId"));
    roles.insert(PersMinRole, QByteArray("persMin"));
    roles.insert(PersMaxRole, QByteArray("persMax"));
    roles.insert(NbEnfantRole, QByteArray("nbEnfant"));

    return roles;
}

void PmsTypeChambreListModel::setRoomTypes(const QList<PmsTypeChambreModel> &list)
{
    listModel = list;
    foreach (const PmsTypeChambreModel &typeChambre, list) {
        //TODO m_items.append(typeChambre);
    }
}
