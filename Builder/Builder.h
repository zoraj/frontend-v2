#pragma once
#include <QObject>
#include <QJsonArray>

class Builder {
public:
    virtual ~Builder(){}
    virtual void create(const QByteArray &json) const = 0;
    virtual QObject *get() const = 0;
};
