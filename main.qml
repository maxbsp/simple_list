import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13

Window {
    visible: true
    width: 320
    height: 480
    title: qsTr("Контакты")

    ListModel {
        id: contactsModel
        ListElement {
            name: "Василий"
        }
        ListElement {
            name: "Анна"
        }
        ListElement {
            name: "Максим"
        }
    }

    ListView {
        anchors.fill: parent
        model: contactsModel
        delegate: ContactItem {
            text: name
        }
    }
}
