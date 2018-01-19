#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QQmlContext>
//#include<QQuickView>*/
#include<QSqlQueryModel>
#include "contact.h"
#include<QStringList>
#include<qqmlengine.h>
#include<qqmlcontext.h>
#include<qqml.h>
#include<QtQuick/qquickitem.h>
#include<QtQuick/qquickview.h>
#include<QSqlQuery>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


    qmlRegisterType<Contact>("io.Contact", 1, 0, "Contact");
    Contact cc;

     cc.ctdb("QMYSQL","localhost","cccfab","root","");


     QStringList datalist;
     QSqlQuery q;
     q.exec("SELECT designation FROM contactcc");
     while (q.next()){
         datalist.append(q.value("designation").toString());
     }

     QQmlApplicationEngine engine;
     QQmlContext *ctxt = engine.rootContext();
     ctxt->setContextProperty("myModel",QVariant::fromValue(datalist));
      engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
