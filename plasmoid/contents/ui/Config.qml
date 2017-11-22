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

import QtQuick 2.7
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.2 as QtControls

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id: config

    property alias cfg_update_interval: update_interval_spinbox.value
    property alias cfg_warning_threshold: warning_threshold_spinbox.value
    property alias cfg_font_size: font_size_spinbox.value
    property alias cfg_timestamp_command: timestamp_command_label.text
    property string cfg_warning_color

    GridLayout {
        id: layout

        columns: 2
        columnSpacing: 10
        rowSpacing: 10

        QtControls.Label {
            text: i18n("Font Size:")
            Layout.alignment: Qt.AlignRight
        }

        QtControls.SpinBox {
            id: font_size_spinbox
            suffix: i18nc("Abbreviation for points", "pt")
            minimumValue: 8
            stepSize: 1
        }

        QtControls.Label {
            text: i18n("Warnging threshold:")
            Layout.alignment: Qt.AlignRight
        }

        QtControls.SpinBox {
            id: warning_threshold_spinbox
            suffix: i18nc("Abbreviation for days", "d")
            minimumValue: 1
            stepSize: 1
        }

        QtControls.Label {
            text: i18n("Warning Color:")
            Layout.alignment: Qt.AlignRight
        }

        ColorPicker {
            id: warning_color_picker
            chosen_color: plasmoid.configuration.warning_color
            onColorSelected: {
                cfg_warning_color = chosen_color.toString()
            }
        }

        QtControls.Label {
            text: i18n("Sync Timestamp:")
            Layout.alignment: Qt.AlignRight
        }

        QtControls.TextField {
            id: timestamp_command_label
            Layout.minimumWidth: config.width / 2
        }

        QtControls.Label {
            text: i18n("Update Interval:")
            Layout.alignment: Qt.AlignRight
        }

        QtControls.SpinBox {
            id: update_interval_spinbox
            suffix: i18nc("Abbreviation for minutes", "m")
            minimumValue: 1
            stepSize: 1
        }
    }
}

