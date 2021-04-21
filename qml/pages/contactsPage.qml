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
//Import Resources
import "../../res/images/images_png.js" as ImgApp


Item {
    Rectangle {
        id: rectangle
        color: "#00000000"
        anchors.fill: parent

        RowLayout {
            anchors.fill: parent

            Rectangle {
                id: leftSide
                color: "#00000000"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                Layout.maximumHeight: 600
                Layout.maximumWidth: 600
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                Layout.preferredWidth: 200

                Image {
                    id: image
                    anchors.fill: parent
                    source: "../" + ImgApp.image1
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                id: rightSide
                color: "#00000000"
                Layout.maximumWidth: 250
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                Layout.preferredWidth: 200

                ColumnLayout {
                    y: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 20

                    Rectangle {
                        id: photo
                        color: "#00000000"
                        Layout.maximumHeight: 200
                        Layout.maximumWidth: 200
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        Layout.preferredWidth: 200

                        Image {
                            id: image1
                            anchors.fill: parent
                            source: "../" + ImgApp.image2
                            fillMode: Image.PreserveAspectFit
                        }
                    }

                    Rectangle {
                        id: input
                        color: "#00000000"
                        Layout.maximumHeight: 150
                        Layout.maximumWidth: 350
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        Layout.preferredWidth: 200

                        ColumnLayout {
                            anchors.fill: parent

                            TextField {
                                id: textInput
                                text: qsTr("")
                                placeholderText: qsTr("Name")
                                placeholderTextColor: MainTheme.primaryLight_color
                                font.pixelSize: 12
                                Layout.fillWidth: true
                                Layout.preferredHeight: 20
                                Layout.preferredWidth: 80
                            }

                            TextField {
                                id: textInput1
                                text: qsTr("")
                                placeholderText: qsTr("Surname")
                                placeholderTextColor: MainTheme.primaryLight_color
                                font.pixelSize: 12
                                Layout.fillWidth: true
                                Layout.preferredHeight: 20
                                Layout.preferredWidth: 80
                            }

                            TextField {
                                id: textInput2
                                text: qsTr("")
                                placeholderText: qsTr("Profession")
                                placeholderTextColor: MainTheme.primaryLight_color
                                font.pixelSize: 12
                                Layout.fillWidth: true
                                Layout.preferredHeight: 20
                                Layout.preferredWidth: 80
                            }
                        }
                    }
                }
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:680}D{i:4}D{i:8}D{i:7}D{i:10}D{i:9}D{i:6}
}
##^##*/
