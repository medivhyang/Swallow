//
//  SwallowApp.swift
//  Swallow
//
//  Created by Medivh Yang on 2023/7/31.
//

import SwiftUI

@main
struct SwallowApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                DemoFontView()
                    .tabItem {
                        Label("Font", systemImage: "textformat")
                    }
                DemoColorView()
                    .tabItem {
                        Label("Color", systemImage: "paintbrush")
                    }
                DemoGradientView()
                    .tabItem {
                        Label("Gradient", systemImage: "drop")
                    }
            }
        }
    }
}
