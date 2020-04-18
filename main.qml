import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

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

    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        MainToolBar {
            Layout.fillWidth: true
            Layout.margins: 4
            onNewItem: {
                contactsModel.append({name: text});
            }
        }

        ContactList {
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: contactsModel
        }
    }

}
