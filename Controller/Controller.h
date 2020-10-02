#pragma once

#include <QObject>

class Controller : public QObject
{
    Q_OBJECT
public:
    Controller() {}
    virtual ~Controller() {}
    virtual void viewDidLoad() const = 0;
    virtual void viewDidUnload() const = 0;
signals:
    virtual void viewDidLoadWithResult(bool result, QString reason) const = 0;
};
