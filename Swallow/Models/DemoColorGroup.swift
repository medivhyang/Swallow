//
//  DemoColorGroup.swift
//  Swallow
//
//  Created by Medivh Yang on 2023/7/31.
//

import SwiftUI

struct DemoColorGroup: Identifiable {
    var id: String = UUID().uuidString
    var items: [DemoColor]
    var description: String
    
    init(_ items: [DemoColor], description: String = "") {
        self.description = description
        self.items = items
    }
}
