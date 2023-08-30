//
//  DemoFontWeight.swift
//  Swallow
//
//  Created by Medivh Yang on 2023/7/31.
//

import SwiftUI

struct DemoFontWeight: Identifiable {
    var id: String = UUID().uuidString
    var weight: Font.Weight
    var description: String
    
    init(_ weight: Font.Weight, description: String) {
        self.weight = weight
        self.description = description
    }
}
