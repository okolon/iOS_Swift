//
//  GridView.swift
//  swiftUiTraining
//
//  Created by Norman Okolo on 21/04/2023.
//

import SwiftUI

struct GridView: View {
    let users = ["Norman", "Tai", "Humzah", "Glenn", "Bushan", "Isaiah", "Mohammed", "Payam"]
    let columnsArray = [GridItem(),GridItem(),GridItem()]
    
    var body: some View {
        ScrollView{
            VStack{
                    LazyVGrid(columns: columnsArray){
                        ForEach(users, id: \.self){ item in
                            NavigationLink{
                                DetailScreen(email: item, password: "password")
                            }label: {
                                GridCell(cellData: item)
                            }.foregroundColor(.black)
                        }
                        
                    }
            }

        }.padding(.top, 200)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
