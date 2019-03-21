#include <QDebug>
#include "cameradatamanager.h"

CameraDataManager::CameraDataManager(QObject *parent) : QObject(parent)
{

}

// cameraType
// 0 : not, 1:fore, 2:rear, 3:left, 4:right, 5:camera1, 6:camera2
// aroundType
// 0 : not, 1:4 around, 2:3 fore around, 3: 3 rear around
//
// menu > aournd type : showCameraData (0, 1/2/3)
// around + camera    : showCameraData (1/2/3/4/5/6, 1/2/3)
// only camera        : showCameraData (1/2/3/4/5/6, 0)

void CameraDataManager::onCameraData(int cameraType, int aroundType)
{
    qDebug() << "onCameraData : " << cameraType << "," << aroundType;
}
