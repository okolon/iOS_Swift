//
//  GameScreen.swift
//  swiftUiTraining
//
//  Created by Norman Okolo on 24/04/2023.
//

import SwiftUI

class Game: ObservableObject {
    @Published var streak = 0
    @Published var target = Int.random(in: 1...10)
    @Published var firstNumber = Int.random(in: 1...10)
}

struct GameScreen: View {
    
    @State var showText = true
    @State var showText2 = true
    @ObservedObject var game = Game()
    
    var body: some View {
        VStack{
            Text("Is the number Higher or Lower than...")
                .padding(.bottom, 20)
                .padding(.trailing, 20)
                .padding(.leading, 20)
                .font(.title2)
                .fontWeight(.bold)
            
            if showText {
                Text("\(game.target)")
                    .fontWeight(.bold)
            }
            
            HStack{
                if showText2 {
                    Text("\(game.firstNumber)")
                        .font(.title2)
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                }
            }
          
            HStack{
                Button {
                    if game.firstNumber > game.target{
//                        showText.toggle()
                        game.firstNumber = game.target
                        game.streak += 1
                        game.target = Int.random(in: 1...10)
                    }
                    
                    else if game.firstNumber == game.target{
                        game.firstNumber = game.target
                        game.streak += 1
//                        showText2.toggle()
                        game.target = Int.random(in: 1...10)
                    }
                    
                    else {
                        game.target = Int.random(in: 1...10)
                        game.streak = 0
                    }
                } label: {
                    Text("Higher")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.black)
                }.tint(.red)
                    .buttonStyle(.borderedProminent)
                
                Text("VS")
                    .fontWeight(.semibold)
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                
                Button {
                    if game.firstNumber < game.target{
//                        showText2.toggle()
                        game.firstNumber = game.target
                        game.streak += 1
                        game.target = Int.random(in: 1...10)
                    }
                    
                    else if game.firstNumber == game.target{
                        game.firstNumber = game.target
                        game.streak += 1
                        //                        showText2.toggle()
                        game.target = Int.random(in: 1...10)
                    }
                    
                    else {
                        game.target = Int.random(in: 1...10)
                        game.streak = 0
                    }
                } label: {
                    Text("Lower")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                }.tint(.green)
                    .buttonStyle(.borderedProminent)
            }.padding(.bottom, 10)
            Text("Your streak: \(game.streak)")
                .padding(.bottom, 30)
            
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}
