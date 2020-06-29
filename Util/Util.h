#pragma once
#include <QObject>

class Util
{
public:
    Util();
    static QByteArray getPart(const QByteArray& message, int part, bool toEnd);
};

