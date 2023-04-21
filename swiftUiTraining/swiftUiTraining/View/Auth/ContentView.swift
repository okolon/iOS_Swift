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
    let signUpPrompt = "Don't have an account?"
    @State var emailiD : String = ""
    @State var password : String = ""
    let loginViewModel = LoginViewModel()
    @State var path = [Root]()

    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.init(red: 246 / 255, green: 117 / 255, blue: 113 / 255)
                    .ignoresSafeArea()
                VStack {
                    Group{
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
                        
                        Button("Forgot Password?"){
                            path.append(.forgotP)
                        }.padding(.trailing, 130)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                        
                        Button("Login") {
                            if loginViewModel.validLogin(emailField: emailiD, passwordField: password) {
                                print(emailiD)
                                print(password)
                                
                                path.append(.tabBar)

                            }else {
                                print("Invalid Login")
                            }
                        }.buttonStyle(.borderedProminent)
                            .frame(maxWidth: 150)
                            .padding()
                            .tint(.black)
                        
                    }
                    Group{
                        Text(signUpPrompt)
                            .foregroundColor(.black)
                            .font(.callout)
                            .fontWeight(.light)
                            .padding(.top, 40)
                            .padding(.trailing, 50)
                            .padding(.leading, 50)
                        
                        NavigationLink{
                            ForgotPasswordScreen()
                        }label: {
                            Text("Sign up here")
                        }.padding(.trailing, 50)
                            .padding(.leading, 50)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                }
                .padding()
                .navigationDestination(for: Root.self) { navigate in
                    switch navigate {
                    case .forgotP:
                        ForgotPasswordScreen()
                    case .signUp:
                        EmptyView()
                    case .tabBar:
                        CustomTabBarView()
                    default:
                        EmptyView()
                    }
                }
            }
        }
    }
    enum Root {
        case forgotP
        case signUp
        case tabBar
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
