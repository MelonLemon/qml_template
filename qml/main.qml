import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"
import Qt.labs.platform 1.1
import QtQuick.Layouts 1.0

//Import Design Theme
import "design/colorsMain.js" as MainTheme

//Import Resources
import "../res/images/images.js" as IconsApp


Window {
    id: mainWindow
    width: 1000
    height: 680
    minimumWidth: 800
    minimumHeight: 500
    title: qsTr("Course")
    visible: true
    color: "#00000000"

    //Remove title MenuBar
    flags: Qt.Window | Qt.FramelessWindowHint

    //Text Edit Properties
    property alias actualPage: stackViewMain.currentItem

    //Properties for resizing App's window
    property bool windowFullScreen: false
    property int windowMargin: if (windowFullScreen == false) return 10; else return 0
    property string imageMaximizeRestore: if (windowMargin !== 0) return IconsApp.maximize_icon;
                                          else return  IconsApp.restore_icon


    //Functions

    QtObject {
        id: internal
        // Max/Restore Window
        function changeWindow(){
            setWindowSize()
        }

        //Changing Window Size
        function setWindowSize(){
            if (windowFullScreen == false){
                mainWindow.showMaximized()
                windowFullScreen = true

            } else {
                windowFullScreen = false
                mainWindow.showNormal()
            }
        }


    }

    QtObject {
        id: pages

        //Properties
        //mainPageUrl is used in stackView for initialItem
        property string mainPageUrl: "pages/homePage.qml"
        property var btnClickedLast: subject

        //Make Dictionary of pages url
        property var dictPages : ({
                                      Home : "pages/homePage.qml",
                                      About : "pages/aboutPage.qml",
                                      Contacts : "pages/contactsPage.qml"
                                  })

        //Change page on stackView (pageName  -> type string)
        function showPage(btnClicked, pageName){
            if (btnClicked !== btnClickedLast){
                btnClicked.isActiveMenu =  true
                btnClickedLast.isActiveMenu = false
                stackViewMain.push(Qt.resolvedUrl(dictPages[pageName]))
                btnClickedLast = btnClicked
            }
        }

    }

    Rectangle {
        id: bg
        border.color: MainTheme.primary_color
        border.width: 2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        z: 1

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 2
            anchors.leftMargin: 2
            anchors.bottomMargin: 2
            anchors.topMargin: 2

            Rectangle {
                id: content
                color: MainTheme.primaryDark_color
                anchors.left: leftMenu.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                z: 1

                Rectangle {
                    id: contentPages
                    color: MainTheme.primary_color
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: topBar.bottom
                    anchors.bottom: bottomBarDescription.top
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    StackView {
                        id: stackViewMain
                        anchors.fill: parent
                        initialItem: Qt.resolvedUrl(pages.mainPageUrl)
                    }
                }

                Rectangle {
                    id: bottomBarDescription
                    y: 646
                    height: 30
                    color: MainTheme.primaryLight_color
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0

                    Label {
                        id: labelBottomInfo
                        color: MainTheme.primary_textColor
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 10
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                    }

                    MouseArea {
                        id: resizeDial
                        x: 873
                        y: 0
                        width: 30
                        height: 30
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.bottomMargin: 0
                        visible: windowFullScreen === false ? true : false
                        cursorShape: Qt.SizeFDiagCursor

                        DragHandler{
                            target: null
                            onActiveChanged: if(active){
                                                 mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                             }
                        }

                        Image {
                            id: image
                            opacity: 0.5
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            source: IconsApp.resize_icon
                            smooth: true
                            anchors.topMargin: 5
                            anchors.leftMargin: 5
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.bottomMargin: 0
                            anchors.rightMargin: 0
                            fillMode: Image.PreserveAspectFit
                            antialiasing: false
                        }


                    }
                }

                Rectangle {
                    id: topBar
                    x: 0
                    y: -60
                    height: 60
                    color: MainTheme.primaryDark_color
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    Rectangle {
                        id: topBarDescription
                        y: 35
                        height: 25
                        color: MainTheme.primaryLight_color
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0

                        Label {
                            id: labelTopInfo
                            color: MainTheme.primary_textColor
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            font.pointSize: 10
                            anchors.rightMargin: 300
                            anchors.leftMargin: 10
                        }

                        RowLayout {
                            width: 225
                            anchors.left: labelTopInfo.right
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            anchors.rightMargin: 50
                            anchors.leftMargin: 20

                            DescrTopBarBtn {
                                id: about
                                width: 75
                                text: qsTr("ABOUT")
                                checkable: false
                                isActiveMenu: false
                                display: AbstractButton.TextOnly
                                enabled: true
                                onClicked: {
                                    pages.showPage(about, 'About')
                                }

                            }

                            DescrTopBarBtn {
                                id: contact
                                width: 75
                                text: qsTr("CONTACT")
                                isActiveMenu: false
                                enabled: true
                                onClicked: {
                                    pages.showPage(contact, 'Contacts')
                                }
                            }

                            DescrTopBarBtn {
                                id: subject
                                width: 75
                                text: qsTr("SUBJECT")
                                isActiveMenu: true
                                enabled: true
                                onClicked: {
                                    pages.showPage(subject, 'Home')
                                }
                            }
                        }
                    }

                    Rectangle {
                        id: titleBar
                        height: 35
                        color: MainTheme.primaryDark_color
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.rightMargin: 105
                        anchors.topMargin: 0
                        anchors.leftMargin: 70

                        DragHandler {
                            onActiveChanged: if(active && windowFullScreen == false){
                                                 mainWindow.startSystemMove()
                                             }
                        }


                        Label {
                            id: label
                            color: MainTheme.primary_textColor
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pointSize: 10
                            anchors.leftMargin: 0
                        }
                    }

                    Row {
                        id: rowBtns
                        x: 872
                        width: 105
                        height: 35
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.rightMargin: 0
                        anchors.topMargin: 0

                        TopBarButton {
                            id: btnMinimize
                            colorMouseOver: MainTheme.primaryAccent_color
                            btnIconSource: IconsApp.minimize_icon
                            onClicked: {
                                mainWindow.showMinimized()
                                windowFullScreen = false
                            }
                        }

                        TopBarButton {
                            id: btnMaximizeRestore
                            colorMouseOver: MainTheme.primaryAccent_color
                            btnIconSource: imageMaximizeRestore
                            onClicked: internal.changeWindow()
                        }

                        TopBarButton {
                            id: btnClose
                            colorMouseOver: MainTheme.primaryAccent2_color
                            colorPressed: MainTheme.primaryAccent2_color
                            btnIconSource: IconsApp.close_icon
                            onClicked:{
                                mainWindow.close()
                            }

                        }
                    }
                }


            }

            Rectangle {
                id: leftMenu
                x: 0
                y: 60
                width: 250
                color: MainTheme.primaryDark_color
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                clip: true
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0

                PropertyAnimation {
                    id: animationMenu
                    target: leftMenu
                    property: "width"
                    to: if (leftMenu.width ==70) return 250; else return 70
                    duration: 500
                    easing.type: Easing.InOutQuint

                }

                MouseArea {
                    id: mouseAreaLM
                    width: 10
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 10
                    anchors.topMargin: 10
                    cursorShape: Qt.SizeHorCursor

                    DragHandler{
                        id: handler
                        target: null
                        onActiveChanged: if(active){
                                             if (leftMenu <= 400){

                                             }
                                         }

                    }

                }

                Label {
                    id: label_notes
                    text: qsTr("NOTES")
                    color: MainTheme.primary_textColor
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.rightMargin: 5
                    anchors.leftMargin: 5
                    anchors.topMargin: 60
                }

                Rectangle {
                    id: rectangle
                    color: MainTheme.primaryDark_color
                    border.color: MainTheme.primaryLight_color
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: label_notes.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 25
                    anchors.topMargin: 20

                    Flickable {
                        id: flickable
                        anchors.fill: parent

                        clip: true

                        TextArea.flickable: TextArea {
                            id: textArea
                            padding: 10
                            wrapMode: Text.WordWrap
                            textFormat: Text.AutoText
                            selectByMouse: true
                            selectedTextColor: MainTheme.primary_textColor
                            selectionColor: MainTheme.primaryAccent_textColor
                            color: MainTheme.primary_textColor
                            font.pointSize: 12
                            text: ""

                        }

                        ScrollBar.vertical: ScrollBar{

                        }
                    }



                }

            }
        }
    }
    DropShadow {
        color: MainTheme.primaryLight_color
        radius: 10
        anchors.fill: bg
        source: bg
        samples: 16
        verticalOffset: 0
        horizontalOffset: 0
        z: 0

    }

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        visible: windowFullScreen === false ? true : false
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 mainWindow.startSystemResize(Qt.LeftEdge)
                             }
        }
    }

    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        visible: windowFullScreen === false ? true : false
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 mainWindow.startSystemResize(Qt.RightEdge)
                             }
        }
    }

    MouseArea {
        id: resizeBottom
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.bottomMargin: 0
        visible: windowFullScreen === false ? true : false
        cursorShape: Qt.SizeVerCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 mainWindow.startSystemResize(Qt.BottomEdge)
                             }
        }
    }




}



