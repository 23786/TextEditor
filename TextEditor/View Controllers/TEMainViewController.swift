//
//  ViewController.swift
//  TextEditor
//
//  Created by apple on 2020/2/29.
//  Copyright © 2020 Zhu Yixuan. All rights reserved.
//

import Cocoa


class TEMainViewController: NSViewController, NSTextViewDelegate, NSTextStorageDelegate {
    
    
    // MARK: - Properties
    
    @IBOutlet weak var toolbarView: NSView!
    @IBOutlet weak var textview: NSTextView!
    @IBOutlet weak var toolbarBackground: NSTextField!
    
    @IBOutlet weak var constraintToTop: NSLayoutConstraint!
    
    var isSimpleMode: Bool = false
    
    
    // MARK: - Methods
    
    
    /// Show the word count panel.
    @IBAction func showWordCount(_ sender: NSButton) {
        let vc = WordCountViewController()
        vc.setTextView(textview: self.textview)
        self.presentAsSheet(vc)
    }
    
    /// Hide or show the Toolbar.
    @IBAction func toggleSimpleMode(_ sender: Any) {
        
        switch self.isSimpleMode {
            case false:
                constraintToTop.constant = 10
                self.isSimpleMode = true
            case true:
                constraintToTop.constant = 55
                self.isSimpleMode = false
        }
        
    }
    
    
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the tool bar.
        toolbarBackground.setCornerRadius(cornerRadius: 6.0)
        toolbarView.setCornerRadius(cornerRadius: 6.0)
        
        constraintToTop.constant = 55
        
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
    
    @IBAction func textViewToLight(_ sender: Any) {
        self.textview.appearance = NSAppearance(named: .aqua)
    }
    
    @IBAction func textViewToDark(_ sender: Any) {
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
    
    weak var document: TETextDocument? {
        if let docRepresentedObject = representedObject as? TETextDocument {
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
