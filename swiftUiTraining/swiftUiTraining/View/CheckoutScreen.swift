//
//  CheckoutScreen.swift
//  swiftUiTraining
//
//  Created by Norman Okolo on 24/04/2023.
//

import SwiftUI

struct CheckoutScreen: View {
    @Binding var borrowedVariable : Bool
    @Binding var quantity : Int
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("In your bag...")
                    .padding(.top, 10)
                    .padding(.trailing, 200)
                    .font(.title3)
                Text("\(quantity)x T shirts ")
                    .padding(.trailing, 200)
                    .padding(.top, 10)
                Text("Total = £\(quantity * 15)")
                    .padding(.trailing, 250)
                    .padding(.top, 10)
                    .fontWeight(.bold)
                Spacer()
            }.navigationTitle("MY CLOTHES")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("X") {
                            borrowedVariable = false
                        }.fontWeight(.heavy)
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
        }
    }
}

struct CheckoutScreen_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutScreen(borrowedVariable: .constant(true), quantity: .constant(3))
    }
}
