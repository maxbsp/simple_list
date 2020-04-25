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
            line2: "Был в сети 20 минут назад"
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
            id: list
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: contactsModel
            onMenu: {
                contactListMenu.popup();
            }
        }
    }

    Menu {
        id: contactListMenu
        modal: true
        MenuItem {
            text: "Удалить"
            onTriggered: {
                contactsModel.remove(list.menuIndex);
            }
        }
    }

}
