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
          // mountnewusb(D->devPath());
        QString PathToMount =D->mountPath();
        qDebug()<< " le mountage sra dans : "<<PathToMount;
        setusbfolder(PathToMount);
       //this->setusbfolder("/home/usb/");

       emit sendToQml(PathToMount);
    }
}

//mountage dev/sdX dans /home/usb/
//bool Tools::mountnewusb(QString devpath) {

//QProcess process1;
//QProcess process2;

//process1.setStandardOutputProcess(&process2);

//process1.start("echo password");
//process2.start("sudo -S mount "+devpath+"  /home/usb/");

////process2.start("sudo -S mount "+devpath);
////process2.start("udisksctl   mount -b "+devpath);
//process2.setProcessChannelMode(QProcess::ForwardedChannels);

//// Wait for it to start
//if(!process1.waitForStarted()){
//    qDebug() << "!process1.waitForStarted";
//    return 0;

//}

//bool retval = false;
//QByteArray buffer;
//// To be fair: you only need to wait here for a bit with shutdown,
//// but I will still leave the rest here for a generic solution
//while ((retval = process2.waitForFinished()));
//buffer.append(process2.readAll());
//if (!retval) {
//    qDebug() << "Process 2 error:" << process2.errorString();
//    qDebug() << "Buffer data" << buffer;
//    return 0;
//}
////qDebug() << "Buffer data" << buffer;
//return 1;
//}


void Tools::onmountOut()
{
    // Real time echo data
    qDebug() << m_process->readAllStandardOutput().data();
}






//void Tools::setusbfolder(QString ausbfolder)
//{

//      qDebug() << ".........setusbfolder m_usbfolder:" << ausbfolder;

//      emit sendToQml(ausbfolder);

//}

