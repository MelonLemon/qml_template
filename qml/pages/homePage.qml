import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../controls"
import Qt.labs.platform 1.1
import QtQuick.Layouts 1.0

//Import Design Theme
import "../design/colorsMain.js" as MainTheme

//Import Resources
import "../../res/images/images.js" as IconsApp


Item {
    id: item1


    QtObject {
        id: pages

        //Properties
        //mainPageUrl is used in stackView for initialItem
        property string mainPageUrl: "pagesHome/page1.qml"
        property int currentPageIndex: 0


        //Make Dictionary of pages url
        property var dictPages : ({
                                      Page1 : "pagesHome/page1.qml",
                                      Page2 : "pagesHome/page2.qml",
                                      Page3 : "pagesHome/page3.qml"
                                  })
        property int numberAllPages: Object.keys(dictPages).length
        //Change page on stackView (pageName  -> type string)
        function next(){
            if (currentPageIndex < numberAllPages - 1){
                currentPageIndex ++
                showPages()
            }
        }
        function back(){
            if (currentPageIndex > 0){
                currentPageIndex --
                showPages()
            }
        }
        function showPages() {
            var key = Object.keys(dictPages)[currentPageIndex];
            stackView.push(Qt.resolvedUrl(dictPages[key]))
        }

    }

    Rectangle {
        id: contentPages
        color: MainTheme.primary_color
        anchors.left: parent.left
        anchors.right: pafeInfoAdd.left
        anchors.top: parent.top
        anchors.bottom: changePagesBar.top
        anchors.bottomMargin: 0
        anchors.rightMargin: 0

        StackView {
            id: stackView
            anchors.fill: parent
            initialItem: Qt.resolvedUrl(pages.mainPageUrl)
        }
    }

    Rectangle {
        id: changePagesBar
        y: 566
        height: 60
        color: MainTheme.primaryDark_color
        anchors.left: parent.left
        anchors.right: pafeInfoAdd.left
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 0

        RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter

            TopBarButton {
                id: backBtn
                y: 0
                width: 20
                height: 20
                text: qsTr("Button")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                display: AbstractButton.IconOnly
                heightbtn: 20
                widthbtn: 20
                Layout.preferredHeight: 31
                Layout.preferredWidth: 88
                btnIconSource: "../" + IconsApp.back_icon
                onClicked: {
                    pages.back()
                }
            }

            TopBarButton {
                id: nextBtn
                y: 0
                width: 20
                height: 20
                text: qsTr("Button")
                display: AbstractButton.IconOnly
                heightbtn: 20
                widthbtn: 20
                Layout.preferredHeight: 31
                Layout.preferredWidth: 88
                btnIconSource: "../" + IconsApp.next_icon
                onClicked: {
                    pages.next()
                }
            }
        }


    }

    Rectangle {
        id: pafeInfoAdd
        x: 512
        width: 208
        color: MainTheme.primary_color
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        GridLayout {
            anchors.fill: parent
            anchors.rightMargin: 4
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 10

            x: 0
            y: 20
            rows: 3
            columns: 1

            Label {
                id: descriptionPage
                text: qsTr("DESCRIPTION")
                color: MainTheme.primary_textColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: false
                Layout.preferredHeight: 30
            }

            Rectangle {
                id: infoPage
                color: MainTheme.primaryDark_color
                Layout.fillWidth: true
                Layout.maximumHeight: 200
                Layout.fillHeight: true
                Layout.preferredHeight: 200
                Layout.preferredWidth: 200
            }

            Rectangle {
                id: addInfoPage
                color: MainTheme.primaryDark_color
                Layout.fillWidth: true
                visible: true
                Layout.maximumHeight: 65535
                Layout.fillHeight: true
                Layout.preferredHeight: 200
                Layout.preferredWidth: 200
            }
        }
    }



}

/*##^##
Designer {
    D{i:0;height:480;width:640}
}
##^##*/
