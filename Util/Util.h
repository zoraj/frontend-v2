#pragma once
#include <QObject>

namespace Util {
    static QByteArray getPart(const QByteArray& message, int part, bool toEnd) {
        int characters(toEnd ? -1 : message.indexOf(' ', part) - part);
        return message.mid(part, characters);
    }
}
