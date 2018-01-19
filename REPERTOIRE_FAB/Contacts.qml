import QtQuick 2.0
import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick 2.6
import QtQuick.Controls 2.1
import io.Contact 1.0
import "controls" as Awesome

Item{
    id:ctcc
    // y:rectp.y-50
    FontAwesome {
        id: awesome
        resource: "qrc:///resource/fontawesome-webfont.ttf"
        //resource: "http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/fonts/fontawesome-webfont.ttf"
    }
    Contact{
        id:ccc
    }
    Rectangle{
        id:rt
        width: parent.width
        //  height: parent.height - 60

        anchors.horizontalCenter: parent.horizontalCenter
        color: "lightblue"
        Text {
            id: text
            font.pointSize: 180
            font.family: awesome.family
            text: awesome.loaded ? awesome.icons.fa_user : ""
            anchors.horizontalCenter: parent.horizontalCenter
            color: "white"
        }
    }
    Column{
        width: parent.width
      //  anchors.centerIn: parent
        y:rt.height +230
        Rectangle{
            width:rt.width
            height: 70
            color: "lightblue"
            border.color: "lightblue"
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: name
                text: "CHEF" +" "+ ccc.getName(ccc.getId(ct.text)) +" " + ccc.getSname(ccc.getId(ct.text))
                //anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 20
                color: "#254789"//"white"
                anchors.centerIn: parent
            }
        }
        topPadding: 20
        MenuSeparator {
            anchors.right: parent.right
                contentItem: Rectangle {
                    implicitWidth: ctcc.width -40
                    implicitHeight: 1
                    color: "lightgreen"
                }
            }
        bottomPadding: 20
        Rectangle{
            width: rt.width
            height: 40
            color: "lightblue"
            Text {
                id:num
                font.pointSize: 10
                font.family: awesome.family
                text: awesome.loaded ? awesome.icons.fa_phone + "  " + ccc.getNum(ccc.getId(ct.text)) : ""
                color: "#254789" //"white"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        MenuSeparator {
            anchors.right: parent.right
                contentItem: Rectangle {
                    implicitWidth: ctcc.width -40
                    implicitHeight: 1
                    color: "lightgreen"
                }
            }
        Rectangle{
            width: rt.width
            height: 40
            color: "lightblue"
           Text {
                id:ename
                font.pointSize: 10
                font.family: awesome.family
                text: awesome.loaded ? awesome.icons.fa_mail_forward + "  " +  ccc.getEmail(ccc.getId(ct.text)) :""
                color: "#254789" //"white"
                anchors.horizontalCenter: parent.horizontalCenter
           }
        }
    }
}

/*
Item {
    id: name

ItemDelegate {
    id: control
   // text: qsTr("ItemDelegate")
    FontAwesome {
        id: awesome
        resource: "qrc:///resource/fontawesome-webfont.ttf"
        //resource: "http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/fonts/fontawesome-webfont.ttf"
    }
    Text {
        id: text
        font.pointSize: 230
        font.family: awesome.family
        text: awesome.loaded ? awesome.icons.fa_user : ""
        anchors.horizontalCenter: parent.horizontalCenter
        color: "lightblue"
    }
    contentItem: Text {
        rightPadding: control.spacing
        text: control.text
        font: control.font
        color: control.enabled ? (control.down ? "#17a81a" : "#21be2b") : "#bdbebf"
        elide: Text.ElideRight
        visible: control.text
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        color: control.down ? "#dddedf" : "#eeeeee"

        Rectangle {
            width: parent.width
            height: 7
            color: control.down ? "#17a81a" : "#21be2b"
            anchors.bottom: parent.bottom
        }
    }
    MenuSeparator {
            padding: 0
            topPadding: 12
            bottomPadding: 12
            contentItem: Rectangle {
                implicitWidth: 200
                implicitHeight: 7
                color: "lightblue"
            }
        }
    MenuSeparator {
            padding: 0
            topPadding: 12
            bottomPadding: 12
            contentItem: Rectangle {
                implicitWidth: 200
                implicitHeight: 7
                color: "lightblue"
            }
            anchors.right: parent.right
        }
    Contact{
        id:cc
    }
   /* ListView {
        id:lv
        // anchors.fill: parent
        visible: false
        width: 100; height: 100
        x:rectp.x
        y:rectp.y+50
        model: myModel
        delegate: Button {
            height: 25
            width: rectp.width
            Text { id:txt
                text: modelData
            }
        }
    }*/
 /*   Text {
        id: ccname
       //text: cc.getName(cc.getId(cc.qmlname()))
    }
    MenuSeparator {
        id:sep
            padding: 0
            topPadding: 12
            bottomPadding: 12
            contentItem: Rectangle {
                implicitWidth: 800
                implicitHeight: 7
                color: "lightblue"
            }
            anchors.centerIn: parent
        }
}
}
*/
