//
//  ViewController.swift
//  TextEditor
//
//  Created by apple on 2020/2/29.
//  Copyright © 2020 Zhu Yixuan. All rights reserved.
//

import Cocoa

// MARK: - Control the Font and Tool Bar.

enum displayMode {
    case code, normal
}

enum simpleMode {
    case yes, no
}
var gFlag = displayMode.normal
var gSimpleModeFlag = simpleMode.no

// MARK: - Extensions
public extension NSView {
    
    func setBackground(color: NSColor) {
        wantsLayer = true
        layer?.backgroundColor = color.cgColor
        layer?.setNeedsDisplay()
    }
    
    func setCornerRadius(cornerRadius: CGFloat) {
        wantsLayer = true
        layer?.masksToBounds = true
        layer?.cornerRadius = cornerRadius
    }
    
}

public extension NSButton {
    
    var titleColor : NSColor {
        get {
            let attrTitle = self.attributedTitle
            return attrTitle.attribute(NSAttributedString.Key.foregroundColor, at: 0, effectiveRange: nil) as! NSColor
        }
        set(newColor) {
            let attrTitle = NSMutableAttributedString(attributedString: self.attributedTitle)
            let titleRange = NSMakeRange(0, self.title.count)

            attrTitle.addAttributes([NSAttributedString.Key.foregroundColor: newColor], range: titleRange)
            self.attributedTitle = attrTitle
        }
    }
}


class ViewController: NSViewController, NSTextViewDelegate, NSTextStorageDelegate {
    
    
    // MARK: - Properties
    
    @IBOutlet weak var ToolBarView: NSView!
    @IBOutlet var textview: NSTextView!
    @IBOutlet weak var ModeButton: NSButton!
    @IBOutlet weak var FakeBackground: NSTextField!
    
    @IBOutlet weak var ConstraintToTop: NSLayoutConstraint!
    
    
    // MARK: - Methods
    
    
    /// Show the word count panel.
    @IBAction func showWordCount(_ sender: NSButton) {
        let WCVC = WordCountViewController()
        WCVC.setTextView(textview: self.textview)
        self.presentAsSheet(WCVC)
    }
    
    /// Whether the text view uses the fixed-width font.
    @IBAction func SwitchMode(_ sender: NSButton) {
        switch gFlag {
            case .normal:
                self.textview.font? = NSFont(name: "SF Mono Light", size: (self.textview.font?.pointSize)!)!
                gFlag = .code
                ModeButton.title = "Normal"
            case .code:
                self.textview.font? = NSFont(name: "SF Pro Text Light", size: (self.textview.font?.pointSize)!)!
                gFlag = .normal
                ModeButton.title = "Code"
        }
    }
    
    /// Hide or show the Tool Bar.
    @IBAction func HideShowToolBar(_ sender: Any) {
        switch gSimpleModeFlag {
            case .no:
                ConstraintToTop.constant = 38
                gSimpleModeFlag = .yes
            case .yes:
                ConstraintToTop.constant = 84
                gSimpleModeFlag = .no
        }
    }
    
    
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the font of the text view to the default (SF Pro Text Light).
        gFlag = .normal
        self.textview.font? = NSFont(name: "SF Pro Text Light", size: 16.0)!
        ModeButton.stringValue = "Code"
        
        // set the tool bar.
        FakeBackground.setCornerRadius(cornerRadius: 6.0)
        ToolBarView.setCornerRadius(cornerRadius: 6.0)
        
        gSimpleModeFlag = .no
        ConstraintToTop.constant = 84
        
    }
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Menu
    
    /// Light Appearance (.aqua)
    @IBAction func toLight(_ sender: Any) {
        if #available(OSX 10.14, *) {
            NSApp.appearance = NSAppearance(named: .aqua)
        }
    }
    
    /// Light Appearance (.darkAqua)
    @IBAction func toDark(_ sender: Any) {
        if #available(OSX 10.14, *) {
            NSApp.appearance = NSAppearance(named: .darkAqua)
        }
    }
    
    /// Make the font one point bigger in size.
    @IBAction func biggerFont(_ sender: Any) {
        let a = (self.textview.font?.pointSize)! + 1.0
        self.textview.font? = NSFont(name: self.textview.font!.fontName, size: a)!
    }
    
    /// Make the font one point smaller in size.
    @IBAction func smallerFont(_ sender: Any) {
        let a = (self.textview.font?.pointSize)! - 1.0
        self.textview.font? = NSFont(name: self.textview.font!.fontName, size: a)!
    }
    
    /// Return to the default font size (16px).
    @IBAction func defaultFont(_ sender: Any) {
        self.textview.font? = NSFont(name: self.textview.font!.fontName, size: 16.0)!
    }
    
    @IBAction func tvToLight(_ sender: Any) {
        self.textview.appearance = NSAppearance(named: .aqua)
    }
    
    @IBAction func tvToDark(_ sender: Any) {
        self.textview.appearance = NSAppearance(named: .darkAqua)
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: - Document
    /// - Tag: setRepresentedObjectExample
    
    override var representedObject: Any? {
        didSet {
            // Pass down the represented object to all of the child view controllers.
            for child in children {
                child.representedObject = representedObject
            }
        }
    }
    weak var document: Document? {
        if let docRepresentedObject = representedObject as? Document {
            return docRepresentedObject
        }
        return nil
    }
    
    
    // MARK: - NSTextViewDelegate

    func textDidBeginEditing(_ notification: Notification) {
        document?.objectDidBeginEditing(self)
    }

    func textDidEndEditing(_ notification: Notification) {
        document?.objectDidEndEditing(self)
    }
    
}
