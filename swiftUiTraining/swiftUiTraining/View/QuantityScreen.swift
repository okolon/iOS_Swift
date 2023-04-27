//
//  QuantityScreen.swift
//  swiftUiTraining
//
//  Created by Norman Okolo on 23/04/2023.
//

import SwiftUI

struct QuantityScreen: View {
    @State private var quantity = 0
    @State private var presentCheckout = false
    
    var body: some View {
        VStack{
            Image("modelTshirt")
                .resizable()
                .frame(maxWidth: 400, maxHeight: 250)
                .padding(.bottom, 20)
            
            Text("WHITE T SHIRT")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            HStack{
                Group {
                    Button ("-"){
                        if quantity >= 1{
                            quantity = quantity - 1
                        } else {
                            print ("Too low")
                        }
                    }.foregroundColor(.white)
                        .fontWeight(.heavy)
                        .tint(.black)
                        .buttonStyle(.borderedProminent)
                        .padding(.trailing, 10)
                    Text("\(quantity)")
                        .padding(.trailing, 10)
                        .frame(maxWidth: 35)
                    Button ("+"){
                        quantity = quantity + 1
                    }.foregroundColor(.white)
                        .fontWeight(.heavy)
                        .tint(.black)
                        .buttonStyle(.borderedProminent)
                }
                
                Button("Add to cart"){
                    if quantity > 0 {
                        presentCheckout = true
                    }else{
                        presentCheckout = false
                    }
                }.foregroundColor(.black)
                    .buttonStyle(.borderedProminent)
                    .tint(.white)
                    .border(.black)
                    .sheet(isPresented: $presentCheckout) {
                        CheckoutScreen(borrowedVariable: $presentCheckout, quantity: $quantity)
                    }
            }.padding(.bottom, 20)
            Text("Product details")
                .fontWeight(.light)
                .padding(.trailing, 200)
                .underline()
            Text("- Relaxed fit")
                .padding(.trailing, 200)
                .fontWeight(.light)
                .padding(.top, 10)
            Text("- 100% cotton")
                .padding(.trailing, 180)
                .fontWeight(.light)
            Text("- Model is 6'0 wearing a medium")
                .padding(.trailing, 40)
                .fontWeight(.light)
            
            Spacer()
        }
    }
}

struct QuantityScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuantityScreen()
    }
}
