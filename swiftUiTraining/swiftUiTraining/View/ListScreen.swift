//
//  ListScreen.swift
//  swiftUiTraining
//
//  Created by Norman Okolo on 21/04/2023.
//

import SwiftUI

struct ListScreen: View {
    
    let users = ["Norman", "Tai", "Humzah", "Glenn", "Bushan", "Isaiah", "Mohammed", "Payam"]
    let things = ["Lessons", "Accessability", "Sounds"]
    let sectionsArray = ["Users", "General settings"]
    var body: some View {
        VStack {
            List{
                ForEach(sectionsArray, id: \.self){ sec in
                    Section(sec){
                        if sec == "Users"{
                            ForEach(users, id: \.self){ thing in
                                
                                NavigationLink{
                                    DetailScreen(email: thing, password: "password")
                                }label: {
                                    CustomListCell(thing: thing)
                                }
                            }
                        }else {
                            ForEach(things, id: \.self){ item in
                                HStack{
                                    Image(systemName: "gearshape.fill")
                                    Text(item)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
