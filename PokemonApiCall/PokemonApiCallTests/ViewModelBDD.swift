//
//  ViewModelBDD.swift
//  PokemonApiCallTests
//
//  Created by Norman Okolo on 15/05/2023.
//

import Foundation
import Quick
import Nimble
@testable import PokemonApiCall

class ViewModelBDD: QuickSpec {
    
    override class func spec() {
        describe("Testing Business Logic for Pokemon View Model") { //class/struct for writing test case
            context("Instead of API call we are reading local JSON files") {
                beforeEach {
                    print("before each")
                }
                
                afterEach {
                    print("after each")
                }
                
                it("We are testing getPokemon functions with correct urls and expecting that everything goes correct and you will receive pokemon list") {
                    Task {
                        let pokemonViewModel = PokemonViewModel(manager: FakeNetworkManager())
//                        expect(pokemonViewModel)
                        
                        
                        await pokemonViewModel.getPokemon(urlString: "PokemonTest")
                        let pokemonlist = pokemonViewModel.pokeList
                        
                        expect(pokemonlist.count).to(equal(40))
                        
//                        let error = await pokemonViewModel.customError
//                        expect(error).to(equal(nil))
                    }
                }
                
                it("some test case") {
                    Task {
                        let pokemonViewModel = PokemonViewModel(manager: FakeNetworkManager())
//                        expect(pokemonViewModel)
                        
                        
                        await pokemonViewModel.getPokemon(urlString: "PokemonTest")
                        let pokemonlist = pokemonViewModel.pokeList
                        
                        expect(pokemonlist.count).to(equal(40))
                        
//                        let error = await pokemonViewModel.customEror
//                        expect(error).to(equal(NetworkError.parsingError))
                    }
                }
            }
            
        }
    }
}
