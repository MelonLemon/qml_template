import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

//Import Design Theme
import "../design/colorsMain.js" as MainTheme

//Import Resources
import "../../res/images/images.js" as IconsApp

Button {
    id: btnDescTopBar

    //CUSTOM PROPERTIES
    property color colorDefault:  MainTheme.primaryLight_color
    property color colorMouseOver: MainTheme.primaryDark_color
    property color colorPressed: MainTheme.primaryAccent_color
    property bool isActiveMenu: false


    width: 75
    height: 25
    text: qsTr("Example")

    QtObject {
        id: internal

        //MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnDescTopBar.down){
                                       btnDescTopBar.down ? colorPressed : colorDefault
                                   } else {
                                       btnDescTopBar.hovered ? colorMouseOver : colorDefault
                                   }
    }

    contentItem: Item {
        id: item1
        Text{
            id: textBtn
            text: btnDescTopBar.text
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: MainTheme.primary_textColor
        }

    }

    implicitWidth: 75
    implicitHeight: 25

    background: Rectangle {
      id: bgBtn
      color: internal.dynamicColor
      radius: 1

      Rectangle{


          anchors{
              left: parent.left
              right: parent.right
              bottom: parent.bottom

          }
          color: colorPressed
          height: 2
          visible: isActiveMenu
      }

     }

}


