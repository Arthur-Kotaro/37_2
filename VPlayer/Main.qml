import QtQuick
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    width: 928
    minimumWidth: 5 * 165
    height: 480
    minimumHeight: 480
    color: "black"
    visible: true
    title: qsTr("VPlayer")
    ColumnLayout {
        anchors.fill: parent
        spacing: 5

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: parent.height * 0.7
            Layout.minimumHeight: 150
            color: "black"
            Image {
                id: main_logo
                source: "resources/pic_var_01.png"
                anchors.centerIn: parent
                sourceSize.height: parent.height / 2
                sourceSize.width: parent.width / 2
            }
        }
        Slider {
            Layout.preferredWidth: parent.width
            Layout.fillHeight: true
            Layout.minimumHeight: 30
            Layout.minimumWidth: 400
        }

        RowLayout {
            id: buttons_row
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height * 0.2
            Layout.maximumHeight: 50
            Layout.minimumHeight: 20
            width: parent.width

            Button {
                id: button_play
                 Layout.preferredWidth: parent.width * 0.2
                 Layout.minimumWidth: 100
                 Layout.fillHeight: true
                 //hoverEnabled : true
                 icon.source: "resources/Buttons/Play.png"
                 icon.height: 48
                 icon.width: 48
                 icon.color: "#FF0000"
                 display: Button.IconOnly
                 // contentItem: Text {
                 //     text: "\u25B6"
                 //     font.pixelSize: parent.height * 0.8
                 //     font.family: "Arial"
                 //     color: "#BD00FF"
                 //     horizontalAlignment: Text.AlignHCenter
                 // }
                 background: Rectangle{
                     implicitHeight: parent.availiableHight
                     opacity: button_play.hovered ? 1 : 0.5
                     color: button_play.pressed ? "#F81894" : button_play.down ? "#F81894" : button_play.hovered ? "#FFB900" : "#FFD700"
                     border.color: button_play.down ? "#FFD700" : "#0A0A0A"
                     border.width: 3
                     radius: 6
                 }
                 onClicked: model.revert()
            }

            Button {
                id: button_rewind
                 Layout.preferredWidth: parent.width * 0.2
                 Layout.minimumWidth: 100
                 Layout.fillHeight: true
                 //hoverEnabled : true
                 icon.source: "resources/Buttons/Back.png"
                 icon.height: 48
                 icon.width: 48
                 icon.color: "red"
                 display: Button.IconOnly

                 // contentItem: Text {
                 //     text: "\u23EA"
                 //     font.pixelSize: parent.height * 0.8
                 //     font.family: "Verdana"
                 //     color: "#BD00FF"
                 //     horizontalAlignment: Text.AlignHCenter
                 // }
                 background: Rectangle{
                     implicitHeight: parent.availiableHight
                     opacity: button_rewind.hovered ? 1 : 0.5
                     color: button_rewind.pressed ? "#F81894" : button_rewind.down ? "#F81894" : button_rewind.hovered ? "#FFB900" : "#FFD700"
                     border.color: button_rewind.down ? "#FFD700" : "#0A0A0A"
                     border.width: 3
                     radius: 6
                 }
                 onClicked: model.revert()
            }

            Button {
                id: button_pause
                 Layout.preferredWidth: parent.width * 0.2
                 Layout.minimumWidth: 100
                 Layout.fillHeight: true
                 //hoverEnabled : true
                 icon.source: "resources/Buttons/Pause.png"
                 icon.height: 48
                 icon.width: 48
                 icon.color: "red"
                 display: Button.IconOnly

                 // contentItem: Text {
                 //     text: "\u23F8"
                 //     font.pixelSize: parent.height * 0.8
                 //     font.family: "Arial"
                 //     color: "#BD00FF"
                 //     horizontalAlignment: Text.AlignHCenter
                 // }
                 background: Rectangle{
                     implicitHeight: parent.availiableHight
                     opacity: button_pause.hovered ? 1 : 0.5
                     color: button_pause.pressed ? "#F81894" : button_pause.down ? "#F81894" : button_pause.hovered ? "#FFB900" : "#FFD700"
                     border.color: button_pause.down ? "#FFD700" : "#0A0A0A"
                     border.width: 3
                     radius: 6
                 }
                 onClicked: model.revert()
            }

            Button {
                id: button_forward
                 Layout.preferredWidth: parent.width * 0.2
                 Layout.minimumWidth: 100
                 Layout.fillHeight: true
                 //hoverEnabled : true
                 icon.source: "resources/Buttons/Forward.png"
                 icon.height: 48
                 icon.width: 48
                 icon.color: "red"
                 display: Button.IconOnly
                 // contentItem: Text {
                 //     text: "\u23E9"
                 //     font.pixelSize: parent.height * 0.8
                 //     font.family: "Arial"
                 //     color: "#BD00FF"
                 //     horizontalAlignment: Text.AlignHCenter
                 // }
                 background: Rectangle{
                     implicitHeight: parent.availiableHight
                     opacity: button_forward.hovered ? 1 : 0.5
                     color: button_forward.pressed ? "#F81894" : button_forward.down ? "#F81894" : button_forward.hovered ? "#FFB900" : "#FFD700"
                     border.color: button_forward.down ? "#FFD700" : "#0A0A0A"
                     border.width: 3
                     radius: 6
                 }
                 onClicked: model.revert()
            }

            Slider {
                id: sound
                value: 0.5
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: parent.width * 0.2
                Layout.minimumWidth: 100
                background: Rectangle {
                    x: sound.leftPadding
                    y: sound.topPadding + sound.availableHeight / 2 - height / 2
                    implicitHeight: 4
                    width: sound.availableWidth - 30
                    height: implicitHeight
                    radius: 2
                    color: "#2C2C2C"

                    Rectangle {
                        width: sound.visualPosition * parent.width
                        height: parent.height
                        color: "#00B8FF"
                        radius: 2
                    }
                }
                handle: Rectangle {
                    implicitWidth: 26
                    implicitHeight: 26
                    radius: 13
                    x: sound.leftPadding + sound.visualPosition * (sound.availableWidth - 2 * implicitWidth)
                    y: sound.topPadding + sound.availableHeight / 2 - height / 2
                    color: sound.pressed ? "#00FFFF" : "#1E1E2F"
                    border.color: "#bdbebf"
                }
            }
        }
    }
}
