/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2017 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import Fluid.Core 1.0 as FluidCore
import Fluid.Controls 1.0 as FluidControls

/*!
   \qmltype ApplicationWindow
   \inqmlmodule Fluid.Controls
   \ingroup fluidcontrols

   \brief A window that provides features commonly used for Material Design apps.

   This is normally what you should use as your root component. It provides a \l Toolbar and
   \l PageStack to provide access to standard features used by Material Design applications.

   Here is a short working example of an application:

   \qml
   import QtQuick 2.4
   import Fluid.Controls 1.0 as FluidControls

   FluidControls.ApplicationWindow {
       title: "Application Name"

       initialPage: page

       Page {
           id: page
           title: "Page Title"

           Label {
               anchors.centerIn: parent
               text: "Hello World!"
           }
       }
   }
   \endqml
*/
ApplicationWindow {
    id: window

    /*!
       \qmlproperty color decorationColor

       The color of the status bar or window decorations, if the current
       platform supports it.
     */
    property alias decorationColor: platformExtensions.decorationColor

    property alias appBar: appBar

    /*!
       \qmlproperty Page initialPage

       The initial page shown when the application starts.
     */
    property alias initialPage: pageStack.initialItem

    /*!
       \qmlproperty PageStack pageStack

       The \l PageStack used for controlling pages and transitions between pages.
     */
    property alias pageStack: pageStack

    header: FluidControls.AppToolBar {
        id: appBar
    }

    FluidControls.PageStack {
        id: pageStack

        anchors.fill: parent

        onPushed: appBar.push(page)
        onPopped: appBar.pop(page)
        onReplaced: appBar.replace(page)
    }

    FluidCore.PlatformExtensions {
        id: platformExtensions
        window: window
        decorationColor: Material.shade(window.Material.primaryColor, Material.Shade700)
    }
}
