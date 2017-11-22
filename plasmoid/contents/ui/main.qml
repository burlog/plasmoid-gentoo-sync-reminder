/*
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

import QtQuick 2.0
import QtQuick.Layouts 1.3
import org.kde.kio 1.0 as Kio
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id: main

    width: 72

    // don't show icon in panel
    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation

    // the source of data about cpu
    PlasmaCore.DataSource {
        id: executable
        engine: "executable"

        // the data arrays
        property int timestamp: 0

        connectedSources: [
            plasmoid.configuration.timestamp_command
        ]

        // called when new data is available
        onNewData: {
            if (data["exit code"] == 0) {
                timestamp = Number(data["stdout"])
            } else {
                timestamp = 0
            }
            timestampChanged()
        }

        function days_since_sync() {
            var now = Math.floor(Date.now() / 1000)
            var days = Math.floor((now - executable.timestamp) / 86400)
            return days
        }

        interval: plasmoid.configuration.update_interval * 1000 * 60
    }

    PlasmaCore.ToolTipArea {
        anchors.fill: parent
        active: true
        textFormat: Text.RichText
        mainText: {
            return "<b>Portage Sync Reminder</b>"
        }
        subText: {
            return "<b>Portage sync timestamp</b>: " + new Date(executable.timestamp)
        }
    }

    PlasmaComponents.Label {
        id: label

        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: plasmoid.configuration.font_size

        text: executable.days_since_sync()

        SequentialAnimation {
            running: executable.days_since_sync() > plasmoid.configuration.warning_threshold
            loops: Animation.Infinite

            ColorAnimation {
                target: label
                to: plasmoid.configuration.warning_color
                property: "color"
                duration: 1000
                easing.type: Easing.Linear
            }
            ColorAnimation {
                target: label
                to: theme.textColor
                property: "color"
                duration: 1000
                easing.type: Easing.Linear
            }
        }
    }
}

