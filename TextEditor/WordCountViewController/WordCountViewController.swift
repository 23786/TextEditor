//
//  WordCountViewController.swift
//  TextEditor
//
//  Created by apple on 2020/3/17.
//  Copyright © 2020 Zhu Yixuan. All rights reserved.
//

import Cocoa

class WordCountViewController: NSViewController {

    
    @IBOutlet weak var WordCount: NSTextField!
    @IBOutlet weak var CharCount: NSTextField!
    @IBOutlet weak var ParaCount: NSTextField!
    
    
    func setTextView(textview: NSTextView){
        self.loadView()
        self.title = "Word Count"
        self.WordCount.stringValue = "\(textview.textStorage?.words.count ?? 0)"
        self.CharCount.stringValue = "\(textview.textStorage?.characters.count ?? 0)"
        self.ParaCount.stringValue = "\(textview.textStorage?.paragraphs.count ?? 0)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Word Count"
        // Do view setup here.
    }
    
}
