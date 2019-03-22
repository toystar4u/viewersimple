/****************************************************************************
**
** Copyright (C) 2018 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Virtual Keyboard module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.10
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.1

Rectangle {
    width: 1280
    height: 720

    signal showCameraData (int cameraType, int aroundType)

    Row {

        Column {
            spacing: 10
            Button {
                id: btn_menu
                width: 200
                height: 80
                text: "Menu"
                checkable: true

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 1
                    color: btn_menu.checked ? "green" : "#f0f0f0"
                }

                onCheckedChanged: {
                    if (checked)
                    {
                        pane_menu.visible = true;
                        showCameraData(0, btn_4_around_view.checked?1:
                                                btn_fore_3_around_view.checked?2:
                                                    btn_rear_3_around_view.checked?3:0)
                        pane_around.visible = false;
                        pane_view.visible = false;
                    }
                    else
                    {
                        if (btn_around.checked)
                        {
                            pane_menu.visible = false;
                            pane_around.visible = true;
                            showCameraData(btn_fore.checked?1:
                                               btn_rear.checked?2:0, btn_4_around_view.checked?1:
                                                                         btn_fore_3_around_view.checked?2:
                                                                             btn_rear_3_around_view.checked?3:0)
                            pane_view.visible = false;
                        }
                        else
                        {
                            pane_menu.visible = false;
                            pane_around.visible = false;
                            pane_view.visible = true;
                            showCameraData(btn_fore.checked?1:
                                               btn_rear.checked?2:0, 0)
                        }
                    }
                }
            }

            Button {
                id: btn_around
                width: 200
                height: 80
                text: "Around"
                checkable: true

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 1
                    color: btn_around.checked ? "green" : "#f0f0f0"
                }

                onCheckedChanged: {
                    if (checked)
                    {
                        btn_menu.checked = false;
                        pane_menu.visible = false;
                        pane_around.visible = true;
                        showCameraData(btn_fore.checked?1:
                                           btn_rear.checked?2:0, btn_4_around_view.checked?1:
                                                                     btn_fore_3_around_view.checked?2:
                                                                         btn_rear_3_around_view.checked?3:0)
                        pane_view.visible = false;
                    }
                    else
                    {
                        btn_menu.checked = false;
                        pane_menu.visible = false;
                        pane_around.visible = false;
                        pane_view.visible = true;
                        showCameraData(btn_fore.checked?1:
                                           btn_rear.checked?2:0, 0)
                    }
                }

                Image {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.horizontalCenterOffset: -60
                    width: 70
                    height: 70
                    fillMode: Image.PreserveAspectFit
                    source: "pics/icon_4around.png"
                }
            }

            ButtonGroup {
                buttons: view_btns.children
                onClicked: {
                    console.log("clicked:", button.text)

                    if (btn_around.checked)
                    {
                        showCameraData(btn_fore.checked?1:
                                           btn_rear.checked?2:0, btn_4_around_view.checked?1:
                                                                     btn_fore_3_around_view.checked?2:
                                                                         btn_rear_3_around_view.checked?3:0)
                    }
                    else
                    {
                        showCameraData(btn_fore.checked?1:
                                           btn_rear.checked?2:0, 0)
                    }
                }
            }

            Column {
                id: view_btns
                spacing: 5
                Button {
                    id: btn_fore
                    width: 200
                    height: 85
                    text: "Fore"
                    checkable: true
                    checked: true

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 1
                        color: btn_fore.checked ? "green" : "#f0f0f0"
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.horizontalCenterOffset: -60
                        width: 70
                        height: 70
                        fillMode: Image.PreserveAspectFit
                        source: "pics/icon_fore_camera.png"
                    }

                    onCheckedChanged: {
                        if (!checked) {
                            img_around_left.source = "pics/rear_camera.png"
                            img_camera.source = "pics/rear_camera.png"
                        } else {
                            img_around_left.source = "pics/fore_camera.png"
                            img_camera.source = "pics/fore_camera.png"
                        }
                    }
                }
                Button {
                    id: btn_rear
                    width: 200
                    height: 85
                    text: "Rear"
                    checkable: true

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 1
                        color: btn_rear.checked ? "green" : "#f0f0f0"
                    }

                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.horizontalCenterOffset: -60
                        width: 70
                        height: 70
                        fillMode: Image.PreserveAspectFit
                        source: "pics/icon_rear_camera.png"
                    }

                    onCheckedChanged: {
                        if (checked) {
                            img_around_left.source = "pics/rear_camera.png"
                            img_camera.source = "pics/rear_camera.png"
                        } else {
                            img_around_left.source = "pics/fore_camera.png"
                            img_camera.source = "pics/fore_camera.png"
                        }
                    }
                }
            }
        }

        Pane {
            id: pane_menu
            x: 206
            y: 0
            width: 1080
            height: 720
            visible: false

            Pane {
                id: pane_around_view
                x: 73
                y: 166
                width: 910
                height: 448
                visible: true

                ButtonGroup {
                    buttons: around_view_btns.children
                    onClicked: {
                        console.log("clicked:", button.text)
                        showCameraData(0, btn_4_around_view.checked?1:
                                              btn_fore_3_around_view.checked?2:
                                                  btn_rear_3_around_view.checked?3:0)
                    }
                }

                Row {
                    id: row2
                    Column {
                        id: around_view_btns
                        x: 50
                        anchors.top: parent.top
                        anchors.topMargin: 80
                        spacing: 5
                        Button {
                            id: btn_4_around_view
                            width: 300
                            height: 85
                            text: "4 Around View"
                            checkable: true
                            checked: true

                            Rectangle {
                                anchors.fill: parent
                                anchors.margins: 1
                                color: btn_4_around_view.checked ? "green" : "#f0f0f0"
                            }

                            Image {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.horizontalCenterOffset: -100
                                width: 70
                                height: 70
                                fillMode: Image.PreserveAspectFit
                                source: "pics/icon_4around.png"
                            }
                        }
                        Button {
                            id: btn_fore_3_around_view
                            width: 300
                            height: 85
                            text: "Fore 3 Around View"
                            checkable: true

                            Rectangle {
                                anchors.fill: parent
                                anchors.margins: 1
                                color: btn_fore_3_around_view.checked ? "green" : "#f0f0f0"
                            }

                            Image {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.horizontalCenterOffset: -100
                                width: 65
                                height: 70
                                fillMode: Image.PreserveAspectFit
                                source: "pics/icon_3_fore_around.png"
                            }
                        }
                        Button {
                            id: btn_rear_3_around_view
                            width: 300
                            height: 85
                            text: "Rear 3 Around View"
                            checkable: true

                            Rectangle {
                                anchors.fill: parent
                                anchors.margins: 1
                                color: btn_rear_3_around_view.checked ? "green" : "#f0f0f0"
                            }

                            Image {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.horizontalCenterOffset: -100
                                width: 65
                                height: 70
                                fillMode: Image.PreserveAspectFit
                                source: "pics/icon_3_rear_aound.png"
                            }
                        }
                    }

                    Image {
                        id: img_around_view
                        width: 250
                        height: pane_around_view.height - 20
                        anchors.left: parent.left
                        anchors.leftMargin: 500
                        fillMode: Image.Stretch
                        source: "pics/4around.png"
                    }
                }
            }

        }

        Pane {
            id: pane_around
            x: 206
            y: 0
            width: 1080
            height: 720
            visible: false

            Row {
                Image {
                    id: img_around_left
                    width: pane_around.width * 0.7
                    height: pane_around.height - 20
                    fillMode: Image.Stretch
                    source: "pics/fore_camera.png"
                }

                Image {
                    id: img_around_right
                    width: pane_around.width - img_around_left.width - 20
                    height: pane_around.height - 20
                    fillMode: Image.Stretch
                    source: "pics/4around.png"
                }
            }
        }

        Pane {
            id: pane_view
            x: 206
            y: 0
            width: 1080
            height: 720

            Image {
                id: img_camera
                width: pane_around.width - 20
                height: pane_around.height - 20
                fillMode: Image.Stretch
                source: "pics/fore_camera.png"
            }
        }
    }
}








