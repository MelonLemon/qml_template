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
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                Layout.preferredWidth: 200

                ColumnLayout {
                    anchors.fill: parent

                    Rectangle {
                        id: rectangle1
                        gradient: Gradient {
                            GradientStop {
                                position: 0
                                color: "#00000000"
                            }

                            GradientStop {
                                position: 1
                                color: MainTheme.primaryAccent3_color
                            }
                        }
                        Layout.maximumHeight: 300
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        Layout.preferredWidth: 200
                    }

                    Rectangle {
                        id: rectangle2
                        color: "#00000000"
                        Layout.maximumWidth: 450
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        Layout.preferredWidth: 200

                        GridLayout {
                            anchors.fill: parent
                            anchors.rightMargin: 10
                            anchors.leftMargin: 10
                            anchors.bottomMargin: 10
                            anchors.topMargin: 10
                            transformOrigin: Item.Left
                            columnSpacing: 10
                            rowSpacing: 5
                            rows: 3
                            columns: 3

                            Rectangle {
                                id: rectangle4
                                width: 100
                                height: 100
                                color: MainTheme.primaryAccent_color
                                radius: 20
                                Layout.maximumHeight: 150
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                            }

                            Rectangle {
                                id: rectangle5
                                width: 100
                                height: 100
                                color: MainTheme.primaryAccent2_color
                                radius: 20
                                Layout.maximumHeight: 150
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                            }

                            Rectangle {
                                id: rectangle6
                                width: 100
                                height: 100
                                color: MainTheme.primaryDark_color
                                radius: 20
                                Layout.maximumHeight: 150
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                            }


                        }
                    }
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
                    anchors.fill: parent

                    TextArea {
                        id: textArea
                        text: "This is dummy text "
                        font.pointSize: 20
                        Layout.maximumHeight: 250
                        Layout.preferredHeight: 250
                        color: MainTheme.primary_textColor
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        placeholderText: qsTr("Text Area")
                    }

                    Rectangle {
                        id: rectangle3
                        color: "#00000000"
                        Layout.maximumHeight: 250
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        Layout.preferredWidth: 200

                        ColumnLayout {
                            x: 0
                            y: 0
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter

                            ProgressBar {
                                id: progressBar
                                Layout.fillWidth: true
                                value: 0.5
                                background: Rectangle {
                                    implicitWidth: 200
                                    implicitHeight: 6
                                    color: MainTheme.primary_textColor
                                    radius: 3
                                }

                                contentItem: Item {
                                    implicitWidth: 200
                                    implicitHeight: 4

                                    Rectangle {
                                        id: progressBarColor
                                        width: progressBar.visualPosition * parent.width
                                        height: parent.height
                                        radius: 2
                                        color: MainTheme.primaryAccent_color
                                    }
                                }
                            }

                            ProgressBar {
                                id: progressBar1
                                Layout.fillWidth: true
                                value: 0.8
                                background: Rectangle {
                                    implicitWidth: 200
                                    implicitHeight: 6
                                    color: MainTheme.primary_textColor
                                    radius: 3
                                }

                                contentItem: Item {
                                    implicitWidth: 200
                                    implicitHeight: 4

                                    Rectangle {
                                        width: progressBar1.visualPosition * parent.width
                                        height: parent.height
                                        radius: 2
                                        color: MainTheme.primaryAccent2_color
                                    }
                                }
                            }

                            ProgressBar {
                                id: progressBar2
                                Layout.fillWidth: true
                                value: 0.4
                                background: Rectangle {
                                    implicitWidth: 200
                                    implicitHeight: 6
                                    color: MainTheme.primary_textColor
                                    radius: 3
                                }

                                contentItem: Item {
                                    implicitWidth: 200
                                    implicitHeight: 4

                                    Rectangle {
                                        width: progressBar2.visualPosition * parent.width
                                        height: parent.height
                                        radius: 2
                                        color: MainTheme.primaryDark_color
                                    }
                                }

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
    D{i:0;autoSize:true;height:480;width:680}
}
##^##*/
