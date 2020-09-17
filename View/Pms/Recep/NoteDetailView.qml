import QtQuick 2.12
import cloud.multimicro.mmc.frontend 1.0

NoteDetailViewForm {
    Component.onCompleted: {
        clientNoteDetailRectangle.visible = false
        clientNoteRectangle.visible = false
    }


    rateListView {
        model: 100
    }
    rateDetailListView {
        model: 100
    }
}
