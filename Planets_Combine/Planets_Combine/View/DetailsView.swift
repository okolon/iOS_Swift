//
//  DetailsView.swift
//  Planets_Combine
//
//  Created by Norman Okolo on 08/05/2023.
//

import SwiftUI

struct DetailsView: View {
    
    let planetName: String
    let planetDiameter: String
    let planetClimate: String
    let planetGravity: String
    let planetPopulation: String
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                Text("\(planetName)")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.bottom, 100)
                    .fontWeight(.heavy)
                HStack {
                    VStack {
                        Text("Diameter: ")
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                            .fontWeight(.light)
                        Text("\(planetDiameter)")
                            .foregroundColor(.white)
                            .font(.title2)
                        
                    }.padding(.trailing, 50)
                    VStack {
                        Text("Climate: ")
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                            .fontWeight(.light)
                        Text("\(planetClimate)")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                }.padding(.bottom, 50)
                
                HStack {
                    VStack {
                        Text("Gravity: ")
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                            .fontWeight(.light)
                        Text("\(planetGravity)")
                            .foregroundColor(.white)
                            .font(.title2)
                    }.padding(.trailing, 50)
                    VStack {
                        Text("Population: ")
                            .foregroundColor(.white)
                            .padding(.bottom, 20)
                            .fontWeight(.light)
                        Text("\(planetPopulation)")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                }
                Spacer()
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(planetName: "Tattoine", planetDiameter: "300 miles", planetClimate: "Dry", planetGravity: "6000 Gs", planetPopulation: "24 million")
    }
}
