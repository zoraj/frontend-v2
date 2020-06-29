#pragma once

#include <QObject>
#include <QDebug>
#include <QtSql/QSql>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
#include <QtSql/QSqlRecord>
#include "Model/MmcParametrageModel.h"

class MmcParametrageCache : public QObject
{
public:
    static void persist(const MmcParametrageModel &setting);
    static void merge(const MmcParametrageModel &setting);
    static void persist(QList<MmcParametrageModel> setting);
    static MmcParametrageModel get(const QString &key);
    static QList<MmcParametrageModel> getAll();
};


