//
//  ContentView.swift
//  Swallow
//
//  Created by Medivh Yang on 2023/9/27.
//

import SwiftUI

struct ContentView: View {
    @State private var cards: [CardData] = [
        CardData(title: "Fonts", imageName: "textformat", target: .fonts),
        CardData(title: "Colors", imageName: "paintbrush", target: .colors),
        CardData(title: "Shape Styles", imageName: "square.3.layers.3d", target: .shapeStyles),
        CardData(title: "Gradients", imageName: "camera.filters", target: .gradients)
    ]
    
    @State private var target: Target? = nil
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(), alignment: .center),
                    GridItem(.flexible(), alignment: .center),
                ], alignment: .center, spacing: 16) {
                    ForEach(cards) { card in
                        Button {
                            target = card.target
                        } label: {
                            VStack(alignment: .center, spacing: 16) {
                                Image(systemName: card.imageName)
                                    .frame(width: 30, height: 30)
                                Text(card.title)
                                    .font(.body)
                                    .minimumScaleFactor(0.6)
                            }
                            .padding()
                            .frame(width: 165, height: 100)
                        }
                        .foregroundStyle(.foreground)
                        .background(.bar, in: .rect(cornerRadius: 8))
                    }
                }
                .padding()
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        target = .settings
                    } label: {
                        Image(systemName: "gearshape")
                    }

                }
            }
            .navigationTitle("Swallow")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(item: $target) { target in
                switch target {
                case .settings:
                    SettingsView()
                case .fonts:
                    FontsView()
                case .colors:
                    ColorsView()
                case .shapeStyles:
                    ShapeStylesView()
                case .gradients:
                    GradientsView()
                }
            }
        }
    }
}

private extension ContentView {
    struct CardData: Identifiable {
        var id: String = UUID().uuidString
        var title: String
        var imageName: String
        var target: Target
    }
    
    enum Target {
        case settings, fonts, colors, gradients, shapeStyles
    }
}


#Preview {
    ContentView()
}
