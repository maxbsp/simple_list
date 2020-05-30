import QtQuick 2.0

TextEdit {
    id: me
    property string placeholderText: grayText.text
    selectByMouse: true
    function clear()
    {
        me.text = "";
    }

    Text {
        id: grayText
        visible: parent.text.length === 0
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        color: "#80808080"
        elide: Text.ElideRight
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:50;width:300}
}
##^##*/
