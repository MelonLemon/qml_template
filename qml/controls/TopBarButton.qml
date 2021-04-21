import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

//Import Design Theme
import "../design/colorsMain.js" as MainTheme

//Import Resources
import "../../res/images/images.js" as IconsApp

Button {
    id: btnTopBar

    //CUSTOM PROPERTIES
    property url btnIconSource: "../../res/images/svg_images/minimize_icon.svg"
    property color colorDefault:  MainTheme.primaryDark_color
    property color colorMouseOver: MainTheme.primaryLight_color
    property color colorPressed: MainTheme.primaryDark_color
    property int heightbtn: 16
    property int widthbtn: 16

    QtObject {
        id: internal

        //MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnTopBar.down){
                                       btnTopBar.down ? colorPressed : colorDefault
                                   } else {
                                       btnTopBar.hovered ? colorMouseOver : colorDefault
                                   }
    }


    implicitWidth: 35
    implicitHeight: 35

    background: Rectangle {
      id: bgBtn
      color: internal.dynamicColor
      radius: 1
     }
    contentItem: Item {
        id: content
        Image {
            id: iconBtn

            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            smooth: true
            height: heightbtn
            width: widthbtn
            source: btnIconSource
            visible: false

        }
        ColorOverlay {
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }
    }

}


