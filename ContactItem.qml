import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

Rectangle {
    id: me
    property alias icon: icon.source
    property alias text: label.text
    property alias text2: label2.text
    property bool selected: false

    signal leftClick()
    signal rightClick()

    width: parent.width
    height: 60

    color: {
        if (selected)
            return "#4fc1e9";
        if (area.containsMouse)
            return "#f1f1f1";
        return "white"
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        spacing: 7
        Image {
            id: icon
            source: "icons/person.png"
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: 7
        }
        ColumnLayout {
            Layout.fillWidth: true
            Label {
                id: label
                Layout.fillWidth: true
                font.bold: true
                text: "Имя контакта"
                elide: Label.ElideRight
            }
            Label {
                id: label2
                Layout.fillWidth: true
                text: "Вторая строка"
                elide: Label.ElideRight
            }
        }
    }
    MouseArea {
        id: area
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button === Qt.LeftButton)
                leftClick();
            if (mouse.button === Qt.RightButton)
                rightClick();
        }
    }
}
