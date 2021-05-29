#include "Tools.h"
#include <QtDebug>
#include <QFile>
#include <QQuickView>
#include <QVBoxLayout>
#include <QtQuickWidgets/QQuickWidget>

Tools::Tools(QObject *parent) : QObject(parent)
{
   // QString mdevremoved;
   // QString mdevPath;

//    //driveadd
    QObject::connect(mUdiskDevice,SIGNAL(deviceAdded(Device*)),this,SLOT(listennewusb(Device*)));
//    //driveremoved
     QObject::connect(mUdiskDevice,SIGNAL(deviceRemoved(Device*)),this,SLOT(removedusb(Device*)));

   //  QObject::connect(this, SIGNAL(qmlSignal()), this, SLOT(receiveFromQmlurl()));




}




void Tools::removedusb(Device *D)
{

      qDebug()<<"........removedusb ..."<<D->removedPath();
      setusbfolder(nullptr);

}

void Tools::listennewusb(Device *D)
{
    if (
            (!QString(D->devPath()).isEmpty())&&
            (QString(D->devPath()).contains("/dev/sd"))
         )        
    {

          mUdiskDevice->mount(D->devPath());

        QString PathToMount =D->mountPath();
        qDebug()<< " le mountage sra dans : "<<PathToMount;
        //usbfolder=PathToMount;
         setusbfolder(PathToMount);
       //this->setusbfolder("/home/usb/");

       emit sendusbToQml(PathToMount);
    }
}










