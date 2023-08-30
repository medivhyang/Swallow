//
//  DemoGradientView.swift
//  Swallow
//
//  Created by Medivh Yang on 2023/7/31.
//

import SwiftUI

struct DemoGradientView: View {
    private var unitPoints: [(point: UnitPoint, description: String)] = [
        (point: .topLeading, description: "topLeading"),
        (point: .top, description: "top"),
        (point: .topTrailing, description: "topTrailing"),
        (point: .leading, description: "leading"),
        (point: .center, description: "center"),
        (point: .trailing, description: "trailing"),
        (point: .bottomLeading, description: "bottomLeading"),
        (point: .bottom, description: "bottom"),
        (point: .bottomTrailing, description: "bottomTrailing"),
        //        (point: .zero, description: "zero"),
    ]
    private let presetColors: [Color] = [
        .black, .white, .gray, .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo, .purple, .pink, .brown
    ]
    
    @State private var stopComponents: [(color: Color, location: Double)] = []
    
    @State private var showSettingsView: Bool = false
    @State private var pickedGradientType: GradientType = .linear
    @State private var enableLocation: Bool = false
    
    // linear
    @State private var pickedStartPoint: UnitPoint = .top
    @State private var pickedEndPoint: UnitPoint = .bottom
    
    // radial
    private static let minRadius: CGFloat = 0
    private static let maxRadius: CGFloat = 1000
    
    @State private var pickedRadialCenterPoint: UnitPoint = .center
    @State private var pickedStartRadius: CGFloat = minRadius
    @State private var pickedEndRadius: CGFloat = maxRadius / 2
    
    // angle
    private static let minAngle: Double = 0
    private static let maxAngle: Double = 360
    
    @State private var pickedAngleCenterPoint: UnitPoint = .center
    @State private var pickedStartAngle: Double = minRadius
    @State private var pickedEndAngle: Double = maxRadius
    
    private var colors: [Color] {
        stopComponents.compactMap { $0.color }
    }
    private var stops: [Gradient.Stop] {
        stopComponents.compactMap { .init(color: $0.color, location: $0.location) }
    }
    
    var body: some View {
        ZStack {
            switch pickedGradientType {
            case .linear:
                if enableLocation {
                    Rectangle()
                        .fill(LinearGradient(stops: stops,startPoint: pickedStartPoint, endPoint: pickedEndPoint))
                } else {
                    Rectangle()
                        .fill(LinearGradient(colors: colors,startPoint: pickedStartPoint, endPoint: pickedEndPoint))
                }
            case .radial:
                if enableLocation {
                    Rectangle()
                        .fill(
                            RadialGradient(stops: stops, center: pickedRadialCenterPoint, startRadius: pickedStartRadius, endRadius: pickedEndRadius)
                        )
                } else {
                    Rectangle()
                        .fill(
                            RadialGradient(colors: colors, center: pickedRadialCenterPoint, startRadius: pickedStartRadius, endRadius: pickedEndRadius)
                        )
                }
            case .angular:
                if enableLocation {
                    Rectangle()
                        .fill(
                            AngularGradient(stops: stops, center: pickedAngleCenterPoint, startAngle: .degrees(pickedStartAngle), endAngle: .degrees( pickedEndAngle))
                        )
                } else {
                    Rectangle()
                        .fill(
                            AngularGradient(colors: colors, center: pickedAngleCenterPoint, startAngle: .degrees(pickedStartAngle), endAngle: .degrees( pickedEndAngle))
                        )
                }
            }
            
            if colors.count == 0 {
                Button{
                    showSettingsView = true
                } label: {
                    Text("Set Gradient")
                        .frame(minHeight: 30)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .onTapGesture {
            showSettingsView = true
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $showSettingsView) {
            settingsView()
                .presentationDetents([.large])
            // TODO: value ".visble" not work
                .presentationDragIndicator(.visible)
        }
    }
    
    @ViewBuilder
    private func settingsView() -> some View {
        ZStack(alignment: .top) {
            Capsule()
                .fill(Color.secondary)
                .opacity(0.5)
                .frame(width: 35, height: 5)
                .padding(6)
                .zIndex(10)
            
            VStack {
                Form {
                    Section {
                        Picker("", selection: $pickedGradientType) {
                            ForEach(GradientType.allCases, id: \.self) { type in
                                Text(type.rawValue).tag(type)
                            }
                        }
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets())
                        .pickerStyle(.segmented)
                    }
                    
                    Section("Paramters") {
                        Toggle("Enable Location", isOn: $enableLocation)
                        
                        switch pickedGradientType {
                        case .linear:
                            liearParamtersView()
                        case .radial:
                            radialParamtersView()
                        case .angular:
                            angleParamtersView()
                        }
                    }
                    
                    colorsParamterView()
                }
                .listRowSpacing(5)
                
                Spacer()
                
                Button{
                    showSettingsView = false
                } label: {
                    HStack {
                        Spacer()
                        Text("Go")
                            .font(.headline)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .frame(minHeight: 30)
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .background(Color(uiColor: .systemGroupedBackground))
        }
    }
    
    @ViewBuilder
    private func liearParamtersView() -> some View {
        HStack {
            Text("Start Point")
            
            Spacer()
            
            Picker("", selection: $pickedStartPoint) {
                ForEach(unitPoints, id: \.point) { point in
                    Text(point.description)
                }
            }
        }
        
        HStack {
            Text("End Point")
            
            Spacer()
            
            Picker("", selection: $pickedEndPoint) {
                ForEach(unitPoints, id: \.point) { point in
                    Text(point.description)
                }
            }
        }
    }
    
    @ViewBuilder
    private func radialParamtersView() -> some View {
        HStack {
            Text("Center Point")
            Spacer()
            Picker("", selection: $pickedRadialCenterPoint) {
                ForEach(unitPoints, id: \.point) { point in
                    Text(point.description)
                }
            }
        }
        
        HStack {
            Text("Start Radius")
            Spacer()
            Slider(value: $pickedStartRadius, in: DemoGradientView.minRadius...DemoGradientView.maxRadius) {
                Text("\(pickedStartRadius, format: .number.precision(.fractionLength(0)))")
            } minimumValueLabel: {
                Text("\(DemoGradientView.minRadius, format: .number.precision(.fractionLength(0)))")
            } maximumValueLabel: {
                Text("\(DemoGradientView.maxRadius, format: .number.precision(.fractionLength(0)))")
            }
            .frame(width: 200)
        }
        
        HStack {
            Text("End Radius")
            Spacer()
            Slider(value: $pickedEndRadius, in: DemoGradientView.minRadius...DemoGradientView.maxRadius) {
                Text("\(pickedStartRadius, format: .number.precision(.fractionLength(0)))")
            } minimumValueLabel: {
                Text("\(DemoGradientView.minRadius, format: .number.precision(.fractionLength(0)))")
            } maximumValueLabel: {
                Text("\(DemoGradientView.maxRadius, format: .number.precision(.fractionLength(0)))")
            }
            .frame(width: 200)
        }
    }
    
    @ViewBuilder
    private func angleParamtersView() -> some View {
        HStack {
            Text("Center Point")
            Spacer()
            Picker("", selection: $pickedAngleCenterPoint) {
                ForEach(unitPoints, id: \.point) { point in
                    Text(point.description)
                }
            }
        }
        
        HStack {
            Text("Start Angle")
            Spacer()
            Slider(value: $pickedStartAngle, in: DemoGradientView.minAngle...DemoGradientView.maxAngle) {
                Text("\(pickedStartRadius, format: .number.precision(.fractionLength(0)))")
            } minimumValueLabel: {
                Text("\(DemoGradientView.minAngle, format: .number.precision(.fractionLength(0)))")
            } maximumValueLabel: {
                Text("\(DemoGradientView.maxAngle, format: .number.precision(.fractionLength(0)))")
            }
            .frame(width: 200)
        }
        
        HStack {
            Text("End Angle")
            Spacer()
            Slider(value: $pickedEndAngle, in: DemoGradientView.minAngle...DemoGradientView.maxAngle) {
                Text("\(pickedStartRadius, format: .number.precision(.fractionLength(0)))")
            } minimumValueLabel: {
                Text("\(DemoGradientView.minAngle, format: .number.precision(.fractionLength(0)))")
            } maximumValueLabel: {
                Text("\(DemoGradientView.maxAngle, format: .number.precision(.fractionLength(0)))")
            }
            .frame(width: 200)
        }
    }
    
    @ViewBuilder
    private func colorsParamterView() -> some View {
        Section {
            ForEach(stopComponents.indices, id: \.self) { index in
                Group {
                    if enableLocation {
                        HStack(spacing: 20) {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(colors[index])
                                .frame(height: 25)
                            Slider(value: $stopComponents[index].location)
                            ColorPicker("", selection: $stopComponents[index].color)
                                .labelsHidden()
                            
                        }
                    } else {
                        HStack(spacing: 20) {
                            HStack(spacing: 20) {
                                Spacer()
                                ColorPicker("", selection: $stopComponents[index].color)
                                    .labelsHidden()
                            }
                        }
                    }
                }
                .listRowBackground(enableLocation ? Color(uiColor: .secondarySystemBackground) : colors[index])
                .swipeActions {
                    Button(role: .destructive, action: {
                        stopComponents.remove(at: index)
                    }, label: {
                        Image(systemName: "trash")
                    })
                }
            }
        } header: {
            HStack(spacing: 25) {
                Text("\(stopComponents.count) colors")
                Spacer()
                Button(role: .destructive) {
                    stopComponents.removeAll()
                } label: {
                    Image(systemName: "xmark.circle")
                }
                Button {
                    let count = stopComponents.count
                    let averageLocationUnit = 1.0 / Double(count)
                    stopComponents.append((color: presetColors.randomElement()!, location: 1))
                    stopComponents.indices.forEach {
                        stopComponents[$0].location = averageLocationUnit * Double($0)
                    }
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
        .listRowSeparator(.hidden)
    }
    
    enum GradientType: String, CaseIterable {
        case linear = "Linear"
        case radial = "Radial"
        case angular = "Angular"
    }
}

#Preview {
    DemoGradientView()
}
