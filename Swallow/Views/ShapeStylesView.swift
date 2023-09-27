//
//  ShapeStyleView.swift
//  Swallow
//
//  Created by Medivh Yang on 2023/9/27.
//

import SwiftUI

struct ShapeStylesView: View {
    @State private var pickedBackgroundColor: Color = Color(uiColor: .systemGroupedBackground)
    
    var body: some View {
        VStack {
            List {
                Text("default")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Text("foreground")
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundStyle(.background)
                    .background(.foreground)
                Text("background")
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.background)
                Text("link")
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.link)
                
                // Material
                Text("ultraThinMaterial")
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.ultraThinMaterial)
                Text("thinMaterial")
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.thinMaterial)
                Text("regularMaterial")
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.regularMaterial)
                Text("thickMaterial")
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.thickMaterial)
                Text("ultraThickMaterial")
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.ultraThickMaterial)
                Text("bar")
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.bar)
            }
            .listRowSpacing(8)
            .scrollContentBackground(.hidden)
            .background(pickedBackgroundColor)
        }
        .navigationTitle("Shape Styles")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Picker("Background Color", selection: $pickedBackgroundColor) {
                    Text("Default").tag(Color(uiColor: .systemGroupedBackground))
                    Text("white").tag(Color(uiColor: .white))
                    Text("black").tag(Color(uiColor: .black))
                    Text("Red").tag(Color.red)
                    Text("Green").tag(Color.green)
                    Text("Blue").tag(Color.blue)
                    Text("Yellow").tag(Color.yellow)
                    Text("Orange").tag(Color.orange)
                    Text("Purple").tag(Color.purple)
                    Text("indigo").tag(Color.indigo)
                }
            }
        }
    }
}

#Preview {
    ShapeStylesView()
}
