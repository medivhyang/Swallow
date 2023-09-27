//
//  SettingsView.swift
//  Swallow
//
//  Created by Medivh Yang on 2023/9/27.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage(AppStorageKeys.colorScheme) private var colorSchemeSetting: ColorSchemeSetting = .auto
    
    var body: some View {
        Form {
            Picker(selection: $colorSchemeSetting) {
                ForEach(ColorSchemeSetting.allCases, id: \.self) { item in
                    Text(item.localizedDescription)
                        .tag(item)
                }
            } label: {
                Text("Color Scheme")
            }
            .foregroundStyle(.primary)
        }
        .navigationTitle("Settigns")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SettingsView()
}
