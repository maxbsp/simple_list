import QtQuick 2.13
import QtGraphicalEffects 1.13

Image {
    id: me
    property alias color: colorOverlay.color
    signal clicked()
    fillMode: Image.PreserveAspectFit

    MouseArea {
        anchors.fill: parent
        onClicked: {
            me.clicked();
        }
    }

    ColorOverlay {
        id: colorOverlay
        anchors.fill: me
        source: me
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:64;width:64}
}
##^##*/
