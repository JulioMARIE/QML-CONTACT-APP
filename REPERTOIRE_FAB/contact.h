#ifndef CONTACT_H
#define CONTACT_H

#include<QObject>
#include<QString>
#include<QQmlContext>
#include<QSqlQueryModel>
#include<QSqlTableModel>
class Contact : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString des READ des WRITE setdes NOTIFY desChanged)

public:
    explicit Contact(QObject *parent = nullptr);


     QString des();
     void setdes(const QString &des);

signals:

     void desChanged();

public slots:
    void ctdb(QString driver, QString hostname, QString databasename, QString username, QString password);
   // QString getDes(); 
    int getId(QString ccname);
   int dbcnt();
   QString getNum(int idcc);
   QString getName(int idcc);
   QString getSname(int idcc);
   QString getEmail(int idcc);
  // void qmlname();
private:
    QString m_des;
    /*QString name;
    QString sname;
    QString num;*/
    QQmlContext *mctxt;
    //QSqlQueryModel *model ;
    //QSqlTableModel *m;
};

#endif // CONTACT_H
