//
//  GameView.swift
//  DesignPatterns
//
//  Created by Norman Okolo on 05/05/2023.
//

import SwiftUI

class Game: ObservableObject {
    @Published var streak = 0
    @Published var target = Int.random(in: 1...10)
    @Published var firstNumber = Int.random(in: 1...10)
}

struct ButtonView: View {
    var delegate: ButtonDelegate?

    var body: some View {
        Button(action: {
            delegate?.buttonTapped()
        }) {
            Text("Tap me!")
                .font(.headline)
        }
    }
}

struct GameView: View {
    
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
                    .padding(.bottom, 30)
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
                        showText2 = false
                        game.firstNumber = Int.random(in: 1...10)
                        game.streak += 1
                        game.target = Int.random(in: 1...10)
                    }
                    
                    else if game.firstNumber == game.target{
                        game.firstNumber = Int.random(in: 1...10)
                        game.streak += 1
                        showText2 = false
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
                        showText2 = false
                        game.firstNumber = Int.random(in: 1...10)
                        game.streak += 1
                        game.target = Int.random(in: 1...10)
                    }
                    
                    else if game.firstNumber == game.target{
                        game.firstNumber = Int.random(in: 1...10)
                        game.streak += 1
                        showText2 = false
                        game.target = Int.random(in: 1...10)
                    }
                    
                    else {
                        game.target = Int.random(in: 1...10)
                        game.streak = 0
                        showText2 = false
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
        GameView(showText: true, showText2: true)
    }
}

