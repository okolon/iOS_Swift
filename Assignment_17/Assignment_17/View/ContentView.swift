//
//  ContentView.swift
//  Assignment_17
//
//  Created by Norman Okolo on 26/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader{ geometry in
                HStack(spacing: 0) {
                    Text("HIGHER")
                        .frame(width: geometry.size.width / 2, height: geometry.size.height)
                        .background(.red)
                        .fontWeight(.bold)
                    Text("LOWER")
                        .frame(width: geometry.size.width / 2, height: geometry.size.height)
                        .background(.green)
                        .fontWeight(.bold)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
