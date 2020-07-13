#ifndef CASHSALEVIEWCONTROLLER_H
#define CASHSALEVIEWCONTROLLER_H

#include <QObject>

#include "Model/PmsVenteComptantModel.h"

class CashSaleViewController : public QObject
{
    Q_OBJECT
    QList<PmsVenteComptantModel> cashSales;

public:
    explicit CashSaleViewController(QObject *parent = nullptr);
    ~CashSaleViewController();
    void loadData();
signals:

};

#endif // CASHSALEVIEWCONTROLLER_H
