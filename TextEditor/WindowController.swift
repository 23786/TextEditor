//
//  WindowController.swift
//  TextEditor
//
//  Created by apple on 2020/2/29.
//  Copyright © 2020 Zhu Yixuan. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController, NSWindowDelegate {
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        shouldCascadeWindows = true
        self.window?.styleMask = .unifiedTitleAndToolbar
    }
    
    // MARK: - Set the Background Color.
    
    @IBAction func darkBlue(_ sender: Any) {
        self.window?.backgroundColor = NSColor(named: "DarkBlueColor")!
    }
    
    @IBAction func darkGreen(_ sender: Any) {
        self.window?.backgroundColor = NSColor(named: "DarkGreenColor")!
    }
    
    @IBAction func brown(_ sender: Any) {
        self.window?.backgroundColor = NSColor(named: "BrownColor")!
    }
    
    @IBAction func lightPurple(_ sender: Any) {
        self.window?.backgroundColor = NSColor(named: "LightPurpleColor")!
    }
    
    /// Return to the default window background color.
    @IBAction func returnDefault(_ sender: Any) {
        self.window?.backgroundColor = .windowBackgroundColor
    }
    
    @IBAction func yellow(_ sender: Any) {
        self.window?.backgroundColor = NSColor(named: "YellowColor")!
    }
    
}

func runCommand(launchPath: String, arguments: [String]) -> String {
    let pipe = Pipe()
    let file = pipe.fileHandleForReading
    
    let task = Process()
    task.launchPath = launchPath
    task.arguments = arguments
    task.standardOutput = pipe
    task.launch()
    
    let data = file.readDataToEndOfFile()
    return String(data: data, encoding: .utf8)!
    
}
