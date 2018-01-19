import QtQuick 2.0
import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
import io.Contact 1.0
import "controls" as Awesome

ApplicationWindow{
    id:app
    visible: true
    //property string nameqmlccname: txt.text
    //    property string txt: ListView.contentItem.data
    color: "lightblue"
    width: 320
    height: 960
    FontAwesome {
        id: awesome
        resource: "qrc:///resource/fontawesome-webfont.ttf"
        //resource: "http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/fonts/fontawesome-webfont.ttf"
    }

   Rectangle{
        id:rectp
        width: parent.width
        height: 70
        color: "lightblue"
        Text {
            id: home
            text: awesome.loaded ? awesome.icons.fa_home : ""
            font.pointSize: 15
            color: "white"
            //anchors.right: ct.left
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if(sv.depth>1) {sv.pop()
                        lv.x = rectp.x
                         lv.y = rectp.y+70
                    ct.text = "  Contact des Chefs de Corps"
                    ct.font.pointSize  = 15
                    //ct.verticalCenter = parent.verticalCenter
                    }

                }
            }
        }
        Text {
            id: ct
            text: qsTr("  Contact des Chefs de Corps")
            font.bold: true
            font.pointSize: 15
            color:  "#254789"
           anchors.verticalCenter : parent.verticalCenter
        }
    }
    /*ListModel{
        id:mymodel
        ListElement{
            name:"cc.getDes()"
        }
    }*/

    Contact{
        id:cc
    }
    /*ListView{
       // id:mylist
        model: myModel
        delegate:  Button{
            id:btconnect
            Text { text: modelData }
            contentItem: Text {
                text: btconnect.text
                font: btconnect.font
                opacity: enabled ? 1.0 : 0.3
                color: btconnect.down ? "#17a81a" : "#21be2b"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                border.color: btconnect.down ? "#17a81a" : "#21be2b"
                border.width: 1
                radius: 2
            }
           onClicked: {
                text="happy"
            }
        }
    }*/

    StackView{
        id:sv
        anchors.fill: parent
        Keys.onReleased: if(event.key === Qt.Key_Back && sv.depth > 1){
                             sv.pop();
                             event.accepted = true;
                         }

    initialItem:

     /*   Rectangle{
            id:rectp
            width: parent.width
            height: 50
            color: "#212121"
            border.color: "lightblue"
            Text {
                id: ct
                text: qsTr("Contact")
                font.bold: true
                font.pointSize: 25
                color: "lightblue"
                anchors.verticalCenter: parent.verticalCenter
            }
        }*/
        ListView {
            id:lv
            // anchors.fill: parent
            width: app.width; height: 1230
            x:rectp.x
            y:rectp.y+70
            model: myModel
            delegate: Rectangle {
                height:50
                border.color: "lightgreen"
                width: rectp.width
                color: "lightblue"
                //anchors.horizontalCenter: parent.horizontalCenter
                Awesome.Text { id:txt
                    icon: awesome.icons.fa_users
                    text: modelData
                    anchors.fill: parent
                    //anchors.centerIn: parent
                    anchors.topMargin: 15
                   // anchors.horizontalCenter: parent.horizontalCenter
                    color: "#254789"

                }
                /* MouseArea{
                onClicked: {
                    cc.ctdb("QMYSQL","localhost","cccfab","root","")
                }
            }*/
               /* function getqmlccname(thename){
                    thename = txt.text
                    return thename
                }*/
                MouseArea{
                    anchors.fill: parent
                onClicked: {
                   // cc.getId(txt.text)
                  // ct.text =  cc.getId(txt.text)

                     ct.text = lv.model? txt.text : ""
                    ct.font.pointSize =   ct.font.pointSize - 8
                    home.color = "white"
                    sv.push(Qt.resolvedUrl("Contacts.qml"))
                    //cc.qmlname()
                   // ld.source = "Contacts.qml"
                   // app.visible = false
                }
            }
        }

    }
}
 /*   Loader{
        id:ld
    }*/
}
