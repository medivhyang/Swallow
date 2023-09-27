//
//  Configs.swift
//  Swallow
//
//  Created by Medivh Yang on 2023/7/31.
//

import SwiftUI

struct Configs {
    static let demoFontSizes: [DemoFontSize] = [
        DemoFontSize(.largeTitle, description: "largeTitle"),
        DemoFontSize(.title, description: "title"),
        DemoFontSize(.title2, description: "title2"),
        DemoFontSize(.title3, description: "title3"),
        DemoFontSize(.headline, description: "headline"),
        DemoFontSize(.body, description: "body"),
        DemoFontSize(.callout, description: "callout"),
        DemoFontSize(.subheadline, description: "subheadline"),
        DemoFontSize(.footnote, description: "footnote"),
        DemoFontSize(.caption, description: "caption"),
        DemoFontSize(.caption2, description: "caption2")
    ]
    
    static let demoFontWeights: [DemoFontWeight] = [
        DemoFontWeight(.ultraLight, description: "ultraLight"),
        DemoFontWeight(.thin, description: "thin"),
        DemoFontWeight(.light, description: "light"),
        DemoFontWeight(.regular, description: "regular"),
        DemoFontWeight(.medium, description: "medium"),
        DemoFontWeight(.semibold, description: "semibold"),
        DemoFontWeight(.bold, description: "bold"),
        DemoFontWeight(.heavy, description: "heavy"),
        DemoFontWeight(.black, description: "black"),
    ]
    
    static let demoColorGroups: [DemoColorGroup] = [
        DemoColorGroup([
            DemoColor(.accentColor, description: "accentColor"),
            
            DemoColor(.primary, textLightColor: .white, textDarkColor: .black),
            DemoColor(.secondary),
            
            DemoColor(.clear),
            DemoColor(.black, textLightColor: .white),
            DemoColor(.white, textDarkColor: .black),
            DemoColor(.gray),
            
            DemoColor(.red),
            DemoColor(.orange),
            DemoColor(.yellow),
            DemoColor(.green),
            DemoColor(.mint),
            DemoColor(.teal),
            DemoColor(.cyan),
            DemoColor(.blue),
            DemoColor(.indigo),
            DemoColor(.purple),
            DemoColor(.pink),
            DemoColor(.brown)
        ], description: "SwiftUI Color"),
        
        DemoColorGroup([
            DemoColor(Color(uiColor: UIColor.link), description: "link"),
            DemoColor(Color(uiColor: UIColor.separator), description: "separator"),
            DemoColor(Color(uiColor: UIColor.opaqueSeparator), description: "opaqueSeparator"),
            DemoColor(Color(uiColor: UIColor.tintColor), description: "tintColor"),
            
            DemoColor(Color(uiColor: UIColor.clear), description: "clear"),
            DemoColor(Color(uiColor: UIColor.black), description: "black", textLightColor: .white),
            DemoColor(Color(uiColor: UIColor.white), description: "white", textDarkColor: .black),
            DemoColor(Color(uiColor: UIColor.gray), description: "gray"),
            DemoColor(Color(uiColor: UIColor.red), description: "red"),
            DemoColor(Color(uiColor: UIColor.yellow), description: "yellow"),
            DemoColor(Color(uiColor: UIColor.green), description: "green"),
            DemoColor(Color(uiColor: UIColor.cyan), description: "cyan"),
            DemoColor(Color(uiColor: UIColor.blue), description: "blue"),
            DemoColor(Color(uiColor: UIColor.purple), description: "purple"),
            DemoColor(Color(uiColor: UIColor.brown), description: "brown"),
            DemoColor(Color(uiColor: UIColor.magenta), description: "magenta"),
        ], description: "UIColor"),
        
        DemoColorGroup([
            DemoColor(Color(uiColor: UIColor.systemGray), description: "systemGray"),
            DemoColor(Color(uiColor: UIColor.systemRed), description: "systemRed"),
            DemoColor(Color(uiColor: UIColor.systemOrange), description: "systemOrange"),
            DemoColor(Color(uiColor: UIColor.systemYellow), description: "systemYellow"),
            DemoColor(Color(uiColor: UIColor.systemGreen), description: "systemGreen"),
            DemoColor(Color(uiColor: UIColor.systemMint), description: "systemMint"),
            DemoColor(Color(uiColor: UIColor.systemTeal), description: "systemTeal"),
            DemoColor(Color(uiColor: UIColor.systemCyan), description: "systemCyan"),
            DemoColor(Color(uiColor: UIColor.systemBlue), description: "systemBlue"),
            DemoColor(Color(uiColor: UIColor.systemIndigo), description: "systemIndigo"),
            DemoColor(Color(uiColor: UIColor.systemPurple), description: "systemPurple"),
            DemoColor(Color(uiColor: UIColor.systemPink), description: "systemPink"),
            DemoColor(Color(uiColor: UIColor.systemBrown), description: "systemBrown"),
        ], description: "UIColor System"),
        
        DemoColorGroup([
            DemoColor(Color(uiColor: UIColor.label), description: "label", textLightColor: .white, textDarkColor: .black),
            DemoColor(Color(uiColor: UIColor.secondaryLabel), description: "secondaryLabel"),
            DemoColor(Color(uiColor: UIColor.tertiaryLabel), description: "tertiaryLabel"),
            DemoColor(Color(uiColor: UIColor.quaternaryLabel), description: "quaternaryLabel"),
        ], description: "UIColor Label"),
        
        DemoColorGroup([
            DemoColor(Color(uiColor: UIColor.systemBackground), description: "systemBackground"),
            DemoColor(Color(uiColor: UIColor.secondarySystemBackground), description: "secondarySystemBackground"),
            DemoColor(Color(uiColor: UIColor.tertiarySystemBackground), description: "tertiarySystemBackground"),
        ], description: "UIColor Backgound"),
        
        DemoColorGroup([
            DemoColor(Color(uiColor: UIColor.systemGroupedBackground), description: "systemGroupedBackground"),
            DemoColor(Color(uiColor: UIColor.secondarySystemGroupedBackground), description: "secondarySystemGroupedBackground"),
            DemoColor(Color(uiColor: UIColor.tertiarySystemGroupedBackground), description: "tertiarySystemGroupedBackground"),
        ], description: "UIColor GroupedBackgound"),
        
        DemoColorGroup([
            DemoColor(Color(uiColor: UIColor.systemFill), description: "systemFill"),
            DemoColor(Color(uiColor: UIColor.secondarySystemFill), description: "secondarySystemFill"),
            DemoColor(Color(uiColor: UIColor.tertiarySystemFill), description: "tertiarySystemFill"),
            DemoColor(Color(uiColor: UIColor.quaternarySystemFill), description: "quaternarySystemFill"),
        ], description: "UIColor SystemFill"),
        
        DemoColorGroup([
            DemoColor(Color(uiColor: UIColor.gray), description: "gray"),
            DemoColor(Color(uiColor: UIColor.systemGray), description: "systemGray"),
            DemoColor(Color(uiColor: UIColor.lightGray), description: "lightGray"),
            DemoColor(Color(uiColor: UIColor.darkGray), description: "darkGray"),
            DemoColor(Color(uiColor: UIColor.systemGray), description: "systemGray"),
            DemoColor(Color(uiColor: UIColor.systemGray2), description: "systemGray2"),
            DemoColor(Color(uiColor: UIColor.systemGray3), description: "systemGray3"),
            DemoColor(Color(uiColor: UIColor.systemGray4), description: "systemGray4"),
            DemoColor(Color(uiColor: UIColor.systemGray5), description: "systemGray5"),
        ], description: "UIColor Gray"),
    ]
}
