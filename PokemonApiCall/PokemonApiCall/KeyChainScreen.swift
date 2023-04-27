//
//  KeyChainScreen.swift
//  PokemonApiCall
//
//  Created by Norman Okolo on 27/04/2023.
//

import SwiftUI
import Security

struct KeyChainScreen: View {
    
    var body: some View {
        VStack {
            Button("Save into Keychain") {
                saveIntoKeyChain(value: "abc", forKey: "mypassword")
            }
            
            Button ("Get data from Keychain") {
                let result = getValueFromKeyChain( forKey: "mypassword")
                print(result)
            }
        }
    }
    
    func saveIntoKeyChain(value: String, forKey: String) { //converting the string into data
        if let data = value.data(using: .utf8){
            //creating query
            let query:[String:Any] = [kSecClass as String: kSecClassGenericPassword, //saving value here
                                      kSecAttrAccount as String: forKey,
                                      kSecValueData as String: data]
            
            SecItemAdd(query as CFDictionary, nil) // storing the query
        }
    }
    
    
    func getValueFromKeyChain(forKey: String) -> String? {
        let query:[String:Any] = [kSecClass as String: kSecClassGenericPassword,
                                  kSecAttrAccount as String: forKey,
                                  kSecReturnData as String: kCFBooleanTrue!,
                                  kSecMatchLimit as String: kSecMatchLimitOne]
            
        var dataTypeRef: AnyObject? = nil // reference for the data
        let status:OSStatus = SecItemCopyMatching(query as Dictionary as CFDictionary, &dataTypeRef) //stores data in variable
        if status == noErr {
            if let data = dataTypeRef as? Data, let string = String(data: data, encoding: .utf8){
                return string
            }
        }
        return nil
    }
}

struct KeyChainScreen_Previews: PreviewProvider {
    static var previews: some View {
        KeyChainScreen()
    }
}
