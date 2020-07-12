//
//  HomeViewController.swift
//  TextEditor
//
//  Created by apple on 2020/2/29.
//  Copyright © 2020 Zhu Yixuan. All rights reserved.
//

import Cocoa

// MARK: - CGColorFromRGB
func NSColorFromRGB(rgbValue: UInt) -> NSColor {
    return NSColor (
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

class TEHomeViewController: NSViewController {

    // MARK: - Properties
    @IBOutlet weak var CustomView: NSView!
    @IBOutlet weak var ImageView: NSImageView!
    @IBOutlet weak var WelcomeLabel: NSTextField!
    @IBOutlet weak var NewDocument: NSButton!
    @IBOutlet weak var OpenDocument: NSButton!
    @IBOutlet weak var AboutButton: NSButton!
    @IBOutlet weak var segControl: NSSegmentedControl!
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Appearance = NSAppearance.current!
        if Appearance == NSAppearance(named: .aqua) {
            segControl.selectedSegment = 0
        } else {
            segControl.selectedSegment = 1
        }
        
        CustomView.setBackground(color: NSColor(red: 64.0, green: 64.0, blue: 64.0, alpha: 0.2))
        CustomView.setCornerRadius(cornerRadius: 16.0)
        
        ImageView.setCornerRadius(cornerRadius: 16.0)
        
        NewDocument.setBackground(color: .orange)
        NewDocument.setCornerRadius(cornerRadius: 12.0)
        
        OpenDocument.setBackground(color: .purple)
        OpenDocument.setCornerRadius(cornerRadius: 12.0)
        
        AboutButton.setCornerRadius(cornerRadius: 12.0)
        AboutButton.setBackground(color: NSColorFromRGB(rgbValue: 0x3E57BF))

    }
    
    // MARK: - Dark / Light Mode
    @IBAction func changeAppearance(_ sender: NSSegmentedControl) {
        switch sender.selectedSegment {
            case 0: toLight(sender)
            case 1: toDark(sender)
            default: fatalError()
        }
    }
    
    @IBAction func toLight(_ sender: Any) {
        NSApp.appearance = NSAppearance(named: .aqua)
    }
    
    @IBAction func toDark(_ sender: Any) {
        NSApp.appearance = NSAppearance(named: .darkAqua)
    }
    
    
}
