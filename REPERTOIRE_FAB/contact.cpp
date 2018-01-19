#include "contact.h"
#include<QSqlDatabase>
#include<QDebug>
#include<QSqlQuery>
#include<QSqlQueryModel>
#include<QSqlRecord>
#include<QQmlContext>
#include<QString>
#include<QQuickView>
#include<QStringList>
#include<QQmlEngine>
#include <QQmlComponent>
Contact::Contact(QObject *parent) :
    QObject (parent)
{

}
void Contact::ctdb(QString driver, QString hostname, QString databasename, QString username, QString password){
    QSqlDatabase db = QSqlDatabase::addDatabase(driver);
    db.setHostName(hostname);
    db.setDatabaseName(databasename);
    db.setUserName(username);
    db.setPassword(password);
    if(!db.open()) qDebug() <<"Fail";
    else qDebug()<<"Like it";
}

int Contact::getId(QString ccname){
    int rqid = 0;
QSqlQuery query;
query.prepare("SELECT id FROM contactcc WHERE contactcc.designation = :ccn");
query.bindValue(":ccn",ccname);
query.exec();
while(query.next()){
rqid = query.value("id").toInt();
}
return rqid;
}
QString Contact::getNum(int idcc){
    QString rqnum ;
    QSqlQuery query;
    query.prepare("SELECT contact FROM contactcc WHERE contactcc.id = :ccid");
    query.bindValue(":ccid",idcc);
    query.exec();
    while(query.next()){
     rqnum = query.value("contact").toString();
    }
    return rqnum;
}
QString Contact::getName(int idcc){
    QString rqname;
    QSqlQuery query;
    query.prepare("SELECT nom FROM contactcc WHERE contactcc.id = :ccid");
    query.bindValue(":ccid",idcc);
    query.exec();
    while(query.next()){
        rqname =  query.value("nom").toString();
    }
    return rqname;
}
QString Contact::getSname(int idcc){
    QString rqsname;
    QSqlQuery query;
    query.prepare("SELECT prenom FROM contactcc WHERE contactcc.id = :ccid");
    query.bindValue(":ccid",idcc);
    query.exec();
    while(query.next()){
        rqsname =  query.value("prenom").toString();
    }
    return rqsname;
}
QString Contact::getEmail(int idcc){
    QString rqemail;
    QSqlQuery query;
    query.prepare("SELECT email FROM contactcc WHERE contactcc.id = :ccid");
    query.bindValue(":ccid",idcc);
    query.exec();
    while(query.next()){
        rqemail =  query.value("email").toString();
    }
    return rqemail;
}
QString Contact::des(){
    return m_des;
}
void Contact::setdes(const QString &des){
    if(des == m_des)
        return;
    m_des = des;
    emit desChanged();
}
int Contact::dbcnt(){
    QSqlQuery q;
    q.exec("SELECT designation FROM contactcc");
    return q.size();
}
