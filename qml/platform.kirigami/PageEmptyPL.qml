/* -*- coding: utf-8-unix -*-
 *
 * Copyright (C) 2018-2019 Rinigus, 2019 Purism SPC
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.5 as Kirigami

Kirigami.Page {
    id: page
    bottomPadding: 0
    leftPadding: 0
    rightPadding: 0
    topPadding: 0

    default property alias content: itemCont.data
    readonly property bool empty: true
    property bool          currentPage: app.pages.currentItem === page

    signal pageStatusActivating
    signal pageStatusActive
    signal pageStatusInactive

    Item {
        id: itemCont
        anchors.fill: parent
    }

    onCurrentPageChanged: {
        if (page.currentPage) {
            pageStatusActivating();
            pageStatusActive();
        } else pageStatusInactive();
    }
}
