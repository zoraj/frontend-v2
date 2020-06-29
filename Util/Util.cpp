#include "Util.h"

Util::Util()
{

}

// Function to split a QByteArray
QByteArray Util::getPart(const QByteArray& message, int part, bool toEnd)
{
    int characters(toEnd ? -1 : message.indexOf(' ', part) - part);
    return message.mid(part, characters);
}
