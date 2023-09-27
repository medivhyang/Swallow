//
//  DemoFontView.swift
//  Swallow
//
//  Created by Medivh Yang on 2023/7/31.
//

import SwiftUI


struct FontsView: View {
    var fontSizes: [DemoFontSize] = Configs.demoFontSizes
    var fontWeights: [DemoFontWeight] = Configs.demoFontWeights
    
    @State var pickedGroupType: GroupType = .weight
    @State var pickedFontSizeIDs: [String] = []
    @State var pickedFontWeightIDs: [String] = []
    
    var filterdFontSizes: [DemoFontSize] {
        guard pickedFontSizeIDs.count > 0 else {
            return fontSizes
        }
        return fontSizes.filter { pickedFontSizeIDs.contains($0.id) }
    }
    var filterdFontWeights: [DemoFontWeight] {
        guard pickedFontWeightIDs.count > 0 else {
            return fontWeights
        }
        return fontWeights.filter { pickedFontWeightIDs.contains($0.id) }
    }
    
    var body: some View {
        VStack {
            Picker("View Type", selection: $pickedGroupType) {
                ForEach(GroupType.allCases, id: \.rawValue) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            if pickedGroupType == .size {
                groupByFontView()
            } else {
                groupByWeightView()
            }
            
            Spacer()
        }
        .navigationTitle("Font")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    func groupByFontView() -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(fontSizes) { size in
                    Button(action: {
                        if pickedFontSizeIDs.contains(size.id) {
                            pickedFontSizeIDs.removeAll { $0 == size.id }
                        } else {
                            pickedFontSizeIDs.append(size.id)
                        }
                    }, label: {
                        Text(size.description)
                    })
                    .buttonStyle(.plain)
                    .padding(8)
                    .background {
                        if pickedFontSizeIDs.contains(size.id) {
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
        .padding([.horizontal])
        .scrollIndicators(.hidden)
        
        List {
            ForEach(filterdFontSizes) { size in
                Section(size.description.uppercased()) {
                    ForEach(fontWeights) { weight in
                        Text(weight.description)
                            .font(size.size)
                            .fontWeight(weight.weight)
                    }
                }
            }
        }
        .headerProminence(.increased)
        .listRowSpacing(8)
        .listStyle(.insetGrouped)
    }
    
    @ViewBuilder
    func groupByWeightView() -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(fontWeights) { weight in
                    Button(action: {
                        if pickedFontWeightIDs.contains(weight.id) {
                            pickedFontWeightIDs.removeAll { $0 == weight.id }
                        } else {
                            pickedFontWeightIDs.append(weight.id)
                        }
                    }, label: {
                        Text(weight.description)
                    })
                    .buttonStyle(.plain)
                    .padding(8)
                    .background {
                        if pickedFontWeightIDs.contains(weight.id) {
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
        .padding([.horizontal])
        .scrollIndicators(.hidden)
        
        List {
            ForEach(filterdFontWeights) { weight in
                Section(weight.description.uppercased()) {
                    ForEach(fontSizes) { size in
                        Text(size.description)
                            .font(size.size)
                            .fontWeight(weight.weight)
                    }
                }
            }
        }
        .headerProminence(.increased)
        .listRowSpacing(8)
        .listStyle(.insetGrouped)
    }
    
    enum GroupType: String, CaseIterable {
        case weight = "Group By Weight"
        case size = "Group By Size"
    }
}

#Preview {
    FontsView()
}
