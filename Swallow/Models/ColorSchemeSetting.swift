//
//  ColorSchemeSetting.swift
//  Swallow
//
//  Created by Medivh Yang on 2023/9/27.
//

import SwiftUI

enum ColorSchemeSetting: String, Codable, CaseIterable {
    case auto = "auto"
    case light = "light"
    case dark = "dark"
    
    var value: ColorScheme? {
        switch self {
        case .auto:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
    
    var localizedDescription: LocalizedStringKey {
        switch self {
        case .auto:
            return "Auto"
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        }
    }
}
