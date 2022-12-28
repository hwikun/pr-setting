//
//  ContentView.swift
//  pr-setting
//
//  Created by hwikun on 2022/12/28.
//

import SwiftUI

struct ContentView: View {
    @State private var isModeOn: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        Text("프로필 화면")
                    } label: {
                        HStack {
                            Image(systemName: "bird.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.all, 10)
                                .foregroundColor(.white)
                                .background(.gray)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("hwihwi")
                                    .font(.system(size: 24))
                                Text("Apple ID, iCloud, 미디어 및 구입")
                                    .font(.system(size: 14))
                            }.padding(.leading, 4)
                        }
                    }
                }
                
                Section {
                    toggleCell(iconName: "airplane", iconColor: .orange, cellTitle: "에어플레인 모드", isModeOn: $isModeOn)
                    NavigationLinkCell(iconName: "wifi", iconColor: .blue, cellTitle: "Wi-Fi") {
                        Text("화면")
                    }
                    NavigationLinkCell(iconName: "point.3.connected.trianglepath.dotted", iconColor: .blue, cellTitle: "Bluetooth") {
                        Text("화면")
                    }
                }
                
                Section {
                    NavigationLinkCell(iconName: "gear", iconColor: .gray, cellTitle: "설정") {
                        Text("화면")
                    }
                    NavigationLinkCell(iconName: "hand.raised.fill", iconColor: .blue, cellTitle: "개인 정보 보호") {
                        Text("화면")
                    }
                    NavigationLinkCell(iconName: "figure.arms.open", iconColor: .blue, cellTitle: "손쉬운 사용") {
                        Text("화면")
                    }
                }
            }
            .navigationTitle(Text("설정"))
        }
    }
    
    @ViewBuilder
    private func iconImage(iconName: String, iconColor: Color) -> some View {
        Image(systemName: iconName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.all, 4)
            .background(iconColor)
            .foregroundColor(.white)
            .cornerRadius(6)
    }
    
    @ViewBuilder
    private func toggleCell(iconName: String, iconColor: Color, cellTitle: String, isModeOn: Binding<Bool>) -> some View {
        HStack {
            iconImage(iconName: iconName, iconColor: iconColor)
            Toggle(cellTitle, isOn: $isModeOn)
        }
    }
    
    @ViewBuilder
    private func NavigationLinkCell<V: View>(iconName: String, iconColor: Color, cellTitle: String, subTitle: String? = nil, destination: @escaping () -> V) -> some View {
        HStack {
            iconImage(iconName: iconName, iconColor: iconColor)
            
            if let subTitle = subTitle {
                NavigationLink {
                    destination()
                } label: {
                    HStack {
                        Text(cellTitle)
                        Spacer()
                        Text(subTitle)
                    }
                }
            } else {
                NavigationLink(cellTitle) {
                    destination()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
