//
//  ListItem.swift
//  pr-setting
//
//  Created by hwikun on 2022/12/28.
//

import SwiftUI

struct ListItem: View {
    let logoName: String
    let listTitle: String
    let backgroundColorName: Color
    let isToggle: Bool
    @State private var isOn: Bool = false
    var body: some View {
        HStack {
            Image(systemName: logoName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 4)
                .background(backgroundColorName)
                .foregroundColor(.white)
                .cornerRadius(6)

            isToggle ? Toggle(listTitle, isOn: $isOn) : NavigationLink {} label: {
                HStack {
                    Text(listTitle)
                }
            }

//            if isToggle {
//                Toggle(listTitle, isOn: $isOn)
//            } else {
//                NavigationLink {
//                    Text("\(listTitle) 화면")
//                } label: {
//                    HStack {
//                        Text(listTitle)
//                        Spacer()
//                        Text("")
//                            .foregroundColor(.gray)
//                    }
//                }
//            }
        }
    }
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(logoName: "hourglass", listTitle: "스크린타임", backgroundColorName: .indigo, isToggle: true)
    }
}
