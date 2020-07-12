//
//  AppDelegate.swift
//  TextEditor
//
//  Created by apple on 2020/2/29.
//  Copyright © 2020 Zhu Yixuan. All rights reserved.
//

import Cocoa

@NSApplicationMain
class TEAppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
        return .terminateNow
    }

}
