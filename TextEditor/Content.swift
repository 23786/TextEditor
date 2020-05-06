//
//  Content.swift
//  TextEditor
//
//  Created by apple on 2020/2/29.
//  Copyright © 2020 Zhu Yixuan. All rights reserved.
//

import Foundation
import Cocoa

class Content: NSObject {
    @objc dynamic var contentString = ""
    
    public init(contentString: String) {
        self.contentString = contentString
    }
    
}

extension Content {
    
    func read(from data: Data) {
        contentString = String(bytes: data, encoding: .utf8)!
    }
    
    func data() -> Data? {
        return contentString.data(using: .utf8)
    }
    
}

