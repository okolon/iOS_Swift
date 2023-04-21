//
//  GridCell.swift
//  swiftUiTraining
//
//  Created by Norman Okolo on 21/04/2023.
//

import SwiftUI

struct GridCell: View {
    
    let cellData : String
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10).fill(.black)
                .frame(width: 100, height: 100)
                .overlay(Text(cellData).foregroundColor(.white))
        }
        
    }
}

struct GridCell_Previews: PreviewProvider {
    static var previews: some View {
        GridCell(cellData: "Day")
    }
}
