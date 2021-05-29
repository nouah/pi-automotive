#ifndef SOUDLISTMODEL_H
#define SOUDLISTMODEL_H

#include <QObject>
#include <QAbstractListModel>
class SoudListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit SoudListModel(QObject *parent = nullptr);

signals:

public slots:
};

#endif // SOUDLISTMODEL_H
