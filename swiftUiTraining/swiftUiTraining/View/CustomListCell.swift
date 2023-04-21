//
//  CustomListCell.swift
//  swiftUiTraining
//
//  Created by Norman Okolo on 21/04/2023.
//

import SwiftUI

struct CustomListCell: View {
    let thing: String
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "folder.fill")
                    .foregroundColor(.init(red: 246 / 255, green: 117 / 255, blue: 113 / 255))
                Text(thing)
            }
        }
    }
}

struct CustomListCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomListCell(thing: "Cell title")
    }
}
