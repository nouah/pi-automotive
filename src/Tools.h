#ifndef TOOLS_H
#define TOOLS_H
#include <QQmlContext>
#include <QObject>
#include "udiskdevice.h"

class Tools : public QObject
{
    Q_OBJECT
public:
     Q_PROPERTY(QString usbfolder READ usbfolder WRITE setusbfolder NOTIFY usbfolderChanged)
    explicit Tools(QObject *parent = nullptr);
    UdiskDevice * mUdiskDevice=new UdiskDevice;

     QString usbfolder() const { return m_usbfolder; }
     void setusbfolder(QString ausbfolder){ m_usbfolder=ausbfolder;  }


signals:


    void sendToQml(QString usbfolder);
    void usbfolderChanged();


public slots:
   void listennewusb(Device *D);
   bool mountnewusb(QString devpath);
 //  void setusbfolder(QString usbfolder);
   void removedusb(Device *D);
   void  onmountOut();


private:
      QString m_usbfolder=nullptr;

  QProcess * m_process=new QProcess();
};

#endif // TOOLS_H
