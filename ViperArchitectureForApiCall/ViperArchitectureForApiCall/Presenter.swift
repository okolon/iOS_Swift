//
//  Presenter.swift
//  ViperArchitectureForApiCall
//
//  Created by Norman Okolo on 16/05/2023.
//

import Foundation
import SwiftUI
import Combine

class Presenter: ObservableObject {
    private let interactor: Interactor
    
    @Published var productThumbnails: [String] = []
    @Published var productTitles: [String] = []
        
    init(interactor: Interactor) {
        self.interactor = interactor
    }
    
    func getProducts() {
        interactor.getProducts { result in
            // Process the fetched product data
            // Call the appropriate method(s) in the View to display the data
        }
    }
}
