//
//  DetailsView.swift
//  Planets_Combine
//
//  Created by Norman Okolo on 08/05/2023.
//

import SwiftUI

struct DetailsView: View {
    
    let planetName: String
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                Text("\(planetName)")
                    .foregroundColor(.white)
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(planetName: "Tattoine")
    }
}
