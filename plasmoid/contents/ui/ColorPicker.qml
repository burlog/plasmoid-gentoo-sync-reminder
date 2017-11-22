/*
 * Copyright (C) 2014 Martin Yrjölä <martin.yrjola@gmail.com>
 * Copyright (C) 2017 Michal Bukovský <burlog@seznam.cz>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License or (at your option) version 3 or any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */

import QtQuick 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.2 as QtControls
import QtQuick.Dialogs 1.0 as QtDialogs
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: colorPicker

    signal colorSelected()

    property alias chosen_color: colorDialog.color

    width: childrenRect.width
    height: childrenRect.height
    Layout.alignment: Qt.AlignVCenter

    Rectangle {
        color: colorDialog.color
        radius: width / 2
        height: 20
        width: height
        opacity: enabled? 1: 0.5
        border {
            width: mouseArea.containsMouse? 3: 1
            color: Qt.darker(colorDialog.color, 1.5)
        }

        QtDialogs.ColorDialog {
            id: colorDialog

            onAccepted: {
                colorSelected()
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            colorDialog.open()
        }
    }
}

