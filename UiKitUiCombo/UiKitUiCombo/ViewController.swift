//
//  ViewController.swift
//  UiKitUiCombo
//
//  Created by Norman Okolo on 26/04/2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToSwiftUI(_ sender: Any) {
        let swiftUIScreen = UIHostingController(rootView: SwiftUIScreen(navigationController: self.navigationController))
        navigationController?.pushViewController(swiftUIScreen, animated: true)
    }
    

}

