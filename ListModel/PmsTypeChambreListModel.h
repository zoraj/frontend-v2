#pragma once

#include <QObject>
#include <QAbstractListModel>
#include "Model/PmsTypeChambreModel.h"

class PmsTypeChambreListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit PmsTypeChambreListModel(QObject *parent);
    ~PmsTypeChambreListModel();
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QHash<int, QByteArray> roleNames() const;
    void setRoomTypes(const QList<PmsTypeChambreModel> &list);
    QList<PmsTypeChambreModel> listModel;
signals:

public slots:

private:
        QList<PmsTypeChambreModel> m_items;
        static const int IdRole;
        static const int LibelleRole;
        static const int ReferenceRole;
        static const int SalonRole;
        static const int PmsCategorieChambreIdRole;
        static const int PersMinRole;
        static const int PersMaxRole;
        static const int NbEnfantRole;
};

