#pragma once

#include <QObject>

struct Establishment: public QObject
{
    QString name;
    QString type;
    QString country;
    QString address;
    QString ownerFirstName;
    QString ownerLastName;
    QString email;
    QString phone;

Q_OBJECT
    Q_PROPERTY(QString email MEMBER email)
    Q_PROPERTY(QString name MEMBER name)
    Q_PROPERTY(QString ownerFirstName MEMBER ownerFirstName)
    Q_PROPERTY(QString ownerLastName MEMBER ownerLastName)
    Q_PROPERTY(QString country MEMBER country)
    Q_PROPERTY(QString address MEMBER address)
    Q_PROPERTY(QString type MEMBER type)
    Q_PROPERTY(QString phone MEMBER phone)
};

