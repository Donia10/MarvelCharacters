//
//  CharactersViewModel.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 19/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation
import Alamofire
protocol CharactersViewModelProtocol {
    var networkService:NetworkServiceProtocol? { get set }
 //   var characters:[Character]? {get set}
    var data:Dataa?{get set}
    var error:String?{get set}
    var bindCharactersToView:()->() {get set}
    var bindError:()->() {get set}
    func getCharacters(offset:Int)
    func getCharacterCell(from character:Character) -> CharacterCell 
    
}
class CharactersViewModel :CharactersViewModelProtocol {
    var networkService:NetworkServiceProtocol?
    var characters:[Character]?{
        didSet{
            bindCharactersToView()
        }
    }
    var error:String?{
        didSet{
            bindError()
        }
    }
    var data: Dataa?{
        didSet {
            bindCharactersToView()
        }
    }
    var bindCharactersToView:()->() = {}
    var bindError:()->() = {}
    init() {
        networkService = NetworkService()
    }
    
    func getCharacters(offset:Int){
        (networkService?.getCharacters(offset: offset){ [weak self] (data,error) in
            if let error:Error = error {
                let message = error.localizedDescription
                self?.error = message
                print(message)
            }else {
//                if let characters = data?.results {
//                    self?.characters = characters
//                }
                self?.data = data
            }
            
            })
    }
    func getCharacterCell(from character:Character) -> CharacterCell {
        return CharacterCell(name: character.name, imagePath: character.thumbnail?.path, imageExtension: character.thumbnail?.thumExtension)
        
    }
}
