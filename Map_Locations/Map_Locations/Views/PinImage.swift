//
//  PinImage.swift
//  Map_Locations
//
//  Created by Norman Okolo on 10/05/2023.
//

import SwiftUI
import CoreLocation
import _MapKit_SwiftUI

struct PulsatingDot: ViewModifier {
    @State var scale: CGFloat = 1.3
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .animation(Animation.easeInOut(duration: 1.3).repeatForever())
            .onAppear {
                self.scale = 2.0
            }
    }
}

struct PinImage: View {
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.cyan)
                .opacity(0.3)
                .frame(width: 30, height: 30)
                .modifier(PulsatingDot())
            
            Circle()
                .fill(Color.white)
                .frame(width: 25, height: 25)
            
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 20)
        }
    }
}


struct PinImage_Previews: PreviewProvider {
    static var previews: some View {
        PinImage()
    }
}
