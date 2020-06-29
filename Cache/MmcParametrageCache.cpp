#include "MmcParametrageCache.h"

void MmcParametrageCache::persist(const MmcParametrageModel &setting)
{
    QSqlQuery query;
    query.prepare("INSERT INTO t_mmc_parametrage(cle,valeur) VALUES (:cle, :valeur)");
    query.bindValue(":cle", setting.cle);
    query.bindValue(":valeur", setting.valeur);
    if (!query.exec()){
        qDebug()<< "Error: " << query.lastQuery() << endl << query.lastError();
    }
}

void MmcParametrageCache::merge(const MmcParametrageModel &setting)
{
    QSqlQuery query;
    query.prepare("UPDATE t_mmc_parametrage"
                  "SET valeur=:valeur"
                  " WHERE cle =:cle");
    query.bindValue(":valeur", setting.valeur);
    query.bindValue(":cle", setting.cle);
    if (!query.exec()){
        qDebug()<< "Error: " << query.lastQuery() << endl << query.lastError();
    }
}

void MmcParametrageCache::persist(QList<MmcParametrageModel> settings)
{
    QSqlQuery query;
    query.prepare("DELETE FROM t_mmc_parametrage");
    if (query.exec()) {
        foreach(const MmcParametrageModel &setting, settings) {
            MmcParametrageCache::persist(setting);
        }
    }
    else {
        qDebug()<< "Error: " << query.lastQuery() << endl << query.lastError();
    }
}

MmcParametrageModel MmcParametrageCache::get(const QString &key)
{
    MmcParametrageModel setting;
    QSqlQuery query;
    query.prepare("SELECT * FROM t_mmc_parametrage WHERE cle=:cle");
    query.bindValue(":cle", key);
    if (!query.exec()) {
        qDebug()<< "Error: " << query.lastQuery() << endl << query.lastError();
    }
    else {
        int cle = query.record().indexOf("cle");
        int valeur = query.record().indexOf("valeur");

        while (query.next()) {
            setting.cle = query.value(cle).toString();
            setting.valeur = query.value(valeur).toString();
        }
    }
    return setting;
}

QList<MmcParametrageModel> MmcParametrageCache::getAll()
{
    QList<MmcParametrageModel> settings;
    QSqlQuery query;
    query.prepare("SELECT * FROM t_mmc_parametrage");
    if (!query.exec()) {
        qDebug()<< "Error: " << query.lastQuery() << endl << query.lastError();
    }
    else {
        int cle = query.record().indexOf("cle");
        int valeur = query.record().indexOf("valeur");

        while (query.next()) {
            MmcParametrageModel setting;
            setting.cle             = query.value(cle).toString();
            setting.valeur         = query.value(valeur).toString();

            settings.append(setting);
        }
    }
    return settings;
}
