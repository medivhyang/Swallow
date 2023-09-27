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
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                Text("foreground")
                    .modifier(ResetListBackground())
                    .foregroundStyle(.background)
                    .background(.foreground)
                Text("background")
                    .modifier(ResetListBackground())
                    .background(.background)
                Text("link")
                    .modifier(ResetListBackground())
                    .background(.link)
                
                // Material
                Text("ultraThinMaterial")
                    .modifier(ResetListBackground())
                    .background(.ultraThinMaterial)
                Text("thinMaterial")
                    .modifier(ResetListBackground())
                    .background(.thinMaterial)
                Text("regularMaterial")
                    .modifier(ResetListBackground())
                    .background(.regularMaterial)
                Text("thickMaterial")
                    .modifier(ResetListBackground())
                    .background(.thickMaterial)
                Text("ultraThickMaterial")
                    .modifier(ResetListBackground())
                    .background(.ultraThickMaterial)
                Text("bar")
                    .modifier(ResetListBackground())
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

private extension ShapeStylesView {
    struct ResetListBackground: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding(.horizontal)
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ShapeStylesView()
}
