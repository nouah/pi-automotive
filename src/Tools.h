#ifndef TOOLS_H
#define TOOLS_H
#include <QQmlContext>
#include <QObject>
#include "udiskdevice.h"

class Tools : public QObject
{
    Q_OBJECT
public:
     Q_PROPERTY(QString usbfolder READ getusbfolder WRITE setusbfolder NOTIFY usbChanged)
    explicit Tools(QObject *parent = nullptr);
    UdiskDevice * mUdiskDevice=new UdiskDevice;
    // QString usbfolder;
     QString getusbfolder()  { return m_usbfolder; }



signals:


    void sendusbToQml(QString usbfolder);
    void usbChanged() ;


public slots:
   void listennewusb(Device *D);

   void removedusb(Device *D);

private slots:
   void setusbfolder(QString newusbfolder){
       if (m_usbfolder == newusbfolder) // Don't notify if the value doesn't change
               return;
       m_usbfolder=newusbfolder;
       emit usbChanged();
   }
private:

  QString m_usbfolder;
  QProcess * m_process=new QProcess();
};

#endif // TOOLS_H
