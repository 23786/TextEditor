//
//  NoteViewController.swift
//  TextEditor
//
//  Created by apple on 2020/3/20.
//  Copyright © 2020 Zhu Yixuan. All rights reserved.
//

import Cocoa

class TENoteViewController: NSViewController {

    @IBOutlet var textview: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.setBackground(color: .white)
        self.view.window?.backgroundColor = .white
        // Do view setup here.
        
    }
    
}
