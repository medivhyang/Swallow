//
//  DemoColorView.swift
//  Swallow
//
//  Created by Medivh Yang on 2023/7/31.
//

import SwiftUI

struct ColorsView: View {
    @Environment(\.colorScheme) var colorScheme
    var groups: [DemoColorGroup] = Configs.demoColorGroups
    
    @State var pickedGroupIDs: [String] = []
    
    var filteredGroups: [DemoColorGroup] {
        guard pickedGroupIDs.count > 0 else {
            return groups
        }
        return groups.filter { pickedGroupIDs.contains($0.id) }
    }
    
    var body: some View {
        VStack {
            groupFilterView()
            
            groupListView()
        }
        .navigationTitle("Colors")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    func groupListView() -> some View {
        List {
            ForEach(filteredGroups) { group in
                Section(group.description.uppercased()) {
                    ForEach(group.items) { item in
                        Group {
                            if colorScheme == .light {
                                Text(item.description)
                                    .foregroundStyle(item.textLightColor)
                            } else {
                                Text(item.description)
                                    .foregroundStyle(item.textDarkColor)
                            }
                        }
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .listRowBackground(item.color)
                    }
                }
            }
        }
        .headerProminence(.increased)
        .listRowSpacing(8)
        .listStyle(.insetGrouped)
    }
    
    @ViewBuilder
    private func groupFilterView() -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(groups, id: \.id) { group in
                    Button {
                        if pickedGroupIDs.contains(group.id) {
                            pickedGroupIDs.removeAll { $0 == group.id }
                        } else {
                            pickedGroupIDs.append(group.id)
                        }
                    } label: {
                        /*@START_MENU_TOKEN@*/Text(group.description)/*@END_MENU_TOKEN@*/
                    }
                    .buttonStyle(.plain)
                    .padding(8)
                    .background {
                        if pickedGroupIDs.contains(group.id) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.accentColor)
                        } else {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.bar)
                        }
                    }
                }
            }
        }
        .padding([.horizontal, .top])
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ColorsView()
}
