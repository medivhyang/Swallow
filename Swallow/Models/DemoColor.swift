//
//  DemoColor.swift
//  Swallow
//
//  Created by Medivh Yang on 2023/7/31.
//

import SwiftUI

struct DemoColor: Identifiable {
    var id: String = UUID().uuidString
    var color: Color
    var description: String
    var textLightColor: Color
    var textDarkColor: Color
    
    init(_ color: Color, description: String, textLightColor: Color = .primary, textDarkColor: Color = .primary) {
        self.description = description
        self.color = color
        self.textLightColor = textLightColor
        self.textDarkColor = textDarkColor
    }
    
    init(_ color: Color, textLightColor: Color = .primary, textDarkColor: Color = .primary) {
        self.description = color.description
        self.color = color
        self.textLightColor = textLightColor
        self.textDarkColor = textDarkColor
    }
}
