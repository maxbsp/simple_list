import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.12

Rectangle {
    id: me
    state: "base"
    color: "steelblue"
    implicitHeight: 40
    property int transitionDuration: 200
    signal newItem(string text)

    function add()
    {
        newItem(textField.text);
    }

    states: [
        State {
            name: "base"
            PropertyChanges {
                target: textField
                visible: false
                x: me.width
                width: 0
            }
        },
        State {
            name: "creation"
            PropertyChanges {
                target: textField
                visible: true
                x: 0
                width: parent.width
            }
        }
    ]

    transitions: [
        Transition {
            from: "base"
            to: "creation"
            NumberAnimation {
                properties: "x,width"
                easing.type: Easing.InOutQuad
                duration: transitionDuration
            }
        },
        Transition {
            from: "creation"
            to: "base"
            SequentialAnimation {
                NumberAnimation {
                    properties: "x,width"
                    easing.type: Easing.InOutQuad
                    duration: transitionDuration
                }
                NumberAnimation {
                    properties: "visible"
                    duration: 0
                }
            }
        }
    ]

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

    TextPanel {
        id: textField
        height: parent.height
        onCanceled: {
            me.state = "base";
        }
        onAccepted: {
            me.add();
            me.state = "base";
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:50;width:500}
}
##^##*/
