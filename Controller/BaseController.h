#pragma once

#include <QObject>

class BaseController : public QObject
{
    Q_OBJECT
public:
    BaseController() {}
    virtual ~BaseController() {}
    virtual void viewDidLoad() const = 0;
    virtual void viewDidUnload() const = 0;
    virtual void viewDidLoadWithResult(bool result, QString reason) const = 0;
};
