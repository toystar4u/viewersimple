#ifndef CAMERADATAMANAGER_H
#define CAMERADATAMANAGER_H

#include <QQmlContext>
#include <QQuickItem>
#include <QObject>
#include <QDebug>

class CameraDataManager : public QObject
{
    Q_OBJECT
public:
    explicit CameraDataManager(QObject *parent = nullptr);

signals:

public slots:
    void onCameraData (int cameraType, int aroundType);
};

#endif // CAMERADATAMANAGER_H
