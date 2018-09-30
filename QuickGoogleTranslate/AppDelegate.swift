//
//  AppDelegate.swift
//  QuickGoogleTranslate
//
//  Created by Keisuke Kawamura on 2018/09/30.
//  Copyright © 2018 Keisuke Kawamura. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet private weak var menu: NSMenu!

    var statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        menu.delegate = self
        statusItem.button?.title = "翻訳"
        statusItem.menu = menu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        sender.windows.forEach {
            $0.makeKeyAndOrderFront(self)
        }
        return true
    }

    @IBAction func didClickQuit(_ sender: NSMenuItem) {
        NSApp.terminate(self)
    }
}

extension AppDelegate: NSMenuDelegate {

    func menuWillOpen(_ menu: NSMenu) {
        NSApp.windows.forEach {
            $0.makeKeyAndOrderFront(self)
        }
        NSApp.activate(ignoringOtherApps: true)
    }
}
