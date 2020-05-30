import QtQuick 2.13
import QtQuick.Layouts 1.13

Rectangle {
    id: me
    implicitHeight: textField.height * 2
    signal canceled()
    signal accepted(var text)
    property alias text: textField.text
    property alias font: textField.font
    property alias color: textField.color

    RowLayout {
        id: row
        anchors.fill: parent
        anchors.margins: 10
        visible: me.width > 50
        spacing: 10
        ImageButton {
            source: "icons/arrow-left.png"
            Layout.fillHeight: true
            Layout.preferredWidth: row.height
            onClicked: {
                me.cancel();
                textField.clear();
            }
        }
        SimpleTextField {
            id: textField
            focus: me.visible
            Layout.alignment: Layout.Center
            Layout.fillWidth: true
            selectByMouse: true

            function accept()
            {
                me.accepted(me.text);
                textField.clear();
            }

            function cancel()
            {
                me.canceled();
                textField.clear();
            }

            Keys.onReturnPressed: accept()
            Keys.onEnterPressed: accept()
            Keys.onEscapePressed: cancel()
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
