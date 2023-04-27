//
//  SignUpScreen.swift
//  swiftUiTraining
//
//  Created by Norman Okolo on 22/04/2023.
//

import SwiftUI

struct SignUpScreen: View {
    
    let emailTag = "Enter email address"
    @State var newEmail : String = ""
    let passwordTag = "Enter new password"
    @State var newPassowrd : String = ""
    let confirmPassword = "Confirm password"
    @State var confirmP : String = ""
    @AppStorage("username") var username = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color.init(red: 246 / 255, green: 117 / 255, blue: 113 / 255)
                    .ignoresSafeArea()
                VStack {
                    Text("Create username")
                        .foregroundColor(.black)
                        .font(.title3)
                        .fontWeight(.light)
                        .padding(.top, 200)
                        .padding(.trailing, 160)
                    
                    TextField("Username", text: $username)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 10)
                        .padding(.leading, 40)
                        .padding(.trailing, 40)
                    
                    Text(emailTag)
                        .foregroundColor(.black)
                        .font(.title3)
                        .fontWeight(.light)
                        .padding(.trailing, 140)
                    
                    TextField("Email", text: $newEmail)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 10)
                        .padding(.leading, 40)
                        .padding(.trailing, 40)
                    
                    Text(passwordTag)
                        .foregroundColor(.black)
                        .font(.title3)
                        .fontWeight(.light)
                        .padding(.trailing, 135)
                    
                    SecureField("Password", text: $newPassowrd)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 10)
                        .padding(.leading, 40)
                        .padding(.trailing, 40)
                    
                    Text(confirmPassword)
                        .foregroundColor(.black)
                        .font(.title3)
                        .fontWeight(.light)
                        .padding(.trailing, 150)
                    
                    SecureField("Password", text: $confirmP)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom, 10)
                        .padding(.leading, 40)
                        .padding(.trailing, 40)
                    
                    Button("Join") {
                    }.buttonStyle(.borderedProminent)
                        .frame(maxWidth: 150)
                        .padding()
                        .tint(.black)
                    
                    Spacer()
                }
            }
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}

