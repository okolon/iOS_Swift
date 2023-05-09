//
//  CustomCell.swift
//  Planets_Combine
//
//  Created by Norman Okolo on 08/05/2023.
//

import SwiftUI

struct CustomCell: View {
    
    let labelOne: String
//    let labelTwo: String
    
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                HStack {
                    Image("planet2")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .padding(.trailing, 50)
                    Text(labelOne)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

struct CustomCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomCell(labelOne: "Earth")
    }
}
