import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.12

Rectangle {
    id: me
    color: "steelblue"
    implicitHeight: 40
    signal newItem(string text)

    function add()
    {
        newItem(textField.text);
        textField.clear();
    }

    RowLayout {
        id: row
        anchors.fill: parent
        anchors.margins: 10
        Label {
            id: name
            text: "SimpleChat"
            color: "white"
            font.bold: true
            font.pixelSize: 14
            Layout.fillWidth: true
        }

        ImageButton {
            id: addButton
            Layout.fillHeight: true
            Layout.preferredWidth: height
            source: "icons/plus.png"
            color: "white"
            onClicked: {
                me.state = "creation"
            }
        }
    }

    Keys.onEnterPressed: {
        add();
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:50;width:500}
}
##^##*/
