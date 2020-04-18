import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

Rectangle {
    id: me
    property alias icon: icon.source
    property alias text: label.text

    width: parent.width
    height: 60

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
        Label {
            id: label
            Layout.fillWidth: true
            font.bold: true
        }
    }
}
