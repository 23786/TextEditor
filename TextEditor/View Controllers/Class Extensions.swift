//
//  Class Extensions.swift
//  TextEditor
//
//  Created by 23786 on 2020/7/12.
//  Copyright © 2020 Zhu Yixuan. All rights reserved.
//

import Cocoa

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
