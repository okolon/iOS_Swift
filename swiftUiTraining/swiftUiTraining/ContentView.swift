//
//  ContentView.swift
//  swiftUiTraining
//
//  Created by Norman Okolo on 20/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    let title = "SIGN IN"
    let emailTag = "Email address"
    let passwordTag = "Password"
    @State var emailiD : String = ""
    @State var password : String = ""

    
    var body: some View {
        ZStack {
            Color.init(red: 246 / 255, green: 117 / 255, blue: 113 / 255)
                 .ignoresSafeArea()
            VStack {
                Image("logo")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .aspectRatio(contentMode: .fit)
                
                Text(emailTag)
                    .foregroundColor(.black)
                    .font(.title3)
                    .fontWeight(.light)
                    .padding(.top, 60)
                    .padding(.trailing, 160)
                
                TextField("Email", text: $emailiD)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 10)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                
                Text(passwordTag)
                    .foregroundColor(.black)
                    .font(.title3)
                    .fontWeight(.light)
                    .padding(.trailing, 195)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 10)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                
                Button("Login") {
                    print("Button  Clicked")
                    print(emailiD)
                    print(password)
                }.buttonStyle(.borderedProminent)
                    .frame(maxWidth: 150)
                    .padding()
                    .tint(.black)
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
