//
//  CustomListCell.swift
//  PokemonApiCall
//
//  Created by Norman Okolo on 25/04/2023.
//

import SwiftUI

struct CustomListCell: View {
    let thing: String
    var body: some View {
        VStack {
            HStack {
                Image("pokeBall")
                    .resizable()
                    .frame(width: 40, height: 30)
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
