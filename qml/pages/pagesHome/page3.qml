import QtQuick 2.4
//Import Design Theme
import "../../design/colorsMain.js" as MainTheme

Item {
    Rectangle {
        id: rectangle
        color: "#00000000"
        anchors.fill: parent

        Text {
            id: text1
            text: qsTr("PAGE 3")
            color: MainTheme.primary_textColor
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
