//
//  ImageScreen.swift
//  swiftUiTraining
//
//  Created by Norman Okolo on 21/04/2023.
//

import SwiftUI

struct ImageScreen: View {
    
    let imageURL : String = "https://images.squarespace-cdn.com/content/v1/619dc4693c018a13038e2d76/d73c4d63-9dbf-413e-bb76-3902d6fcdfa8/ITC+-+Clear+Background+-+Vector+-+Option+1.png?format=1500w"
    
    var body: some View {
        VStack {
            Text("Powered by:")
            AsyncImage(url: URL(string: imageURL))

        }
        
    }
}

struct ImageScreen_Previews: PreviewProvider {
    static var previews: some View {
        ImageScreen()
    }
}
