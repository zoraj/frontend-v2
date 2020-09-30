#pragma once

#include <QObject>

struct Device: public QObject // For consistency, every model inherits QObject
{
    QString uuid;
    QString name;
    QString mmcSiteId;
    QString currency;
    QString language;
    QString apiKey;
};
