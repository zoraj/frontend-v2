import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.12
import "qrc:/View/Component"

Flickable {
    contentHeight: activitiesListView.height
    flickableDirection: Flickable.AutoFlickIfNeeded
    property int mainMargin: 10

}
