//
//  DetailScreen.swift
//  swiftUiTraining
//
//  Created by Norman Okolo on 21/04/2023.
//

import SwiftUI

struct DetailScreen: View {
    let email: String
    let password: String
    let title = "Your profile"
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .padding(50)
                .foregroundColor(.gray)
            Text(title)
                .padding(.bottom, 50)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.init(red: 246 / 255, green: 117 / 255, blue: 113 / 255))
            Text("Email:")
                .padding(.bottom, 20)
                .foregroundColor(.init(red: 246 / 255, green: 117 / 255, blue: 113 / 255))
            Text("\(email)@informationtechconsultants.com")
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
            Text("Password:")
                .padding(.bottom, 20)
                .foregroundColor(.init(red: 246 / 255, green: 117 / 255, blue: 113 / 255))
            Text("\(password)")
            Spacer()
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(email: "Norman", password: "yeahyeah123")
    }
}
