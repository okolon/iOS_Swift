//
//  SwiftUIScreen.swift
//  UiKitUiCombo
//
//  Created by Norman Okolo on 26/04/2023.
//

import SwiftUI

struct SwiftUIScreen: View {
    
    weak var navigationController:UINavigationController?
    
    var body: some View {
        VStack{
            Text("SWIFTUISCREEN")
                .padding()
            
            Button("Go to UIKIT") {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let thirdVC = storyboard.instantiateViewController(withIdentifier: "ThirdViewController")
                navigationController?.pushViewController(thirdVC, animated: true)
            }
        }
    }
}

struct SwiftUIScreen_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIScreen()
    }
}
