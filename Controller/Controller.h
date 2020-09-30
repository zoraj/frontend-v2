#pragma once

#include <QObject>

class Controller : public QObject
{
    Q_OBJECT
public:
    Controller() {}
    virtual ~Controller() {}
    virtual void loadData() const = 0;
    virtual void saveData() const = 0;
};
