//
//  DemoFont.swift
//  Swallow
//
//  Created by Medivh Yang on 2023/7/31.
//

import SwiftUI

struct DemoFontSize: Identifiable {
    var id: String = UUID().uuidString
    var size: Font
    var description: String
    
    init(_ size: Font, description: String) {
        self.size = size
        self.description = description
    }
}
