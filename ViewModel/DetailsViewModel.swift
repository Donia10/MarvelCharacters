//
//  DetailsViewModel.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 22/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation
//
//  CharactersViewModel.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 19/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUI
protocol DetailsModelProtocol {
    var networkService:NetworkServiceProtocol? { get set }
    var thumbnail:Thumbnail?{get set}
    var error:String?{get set}
    var bindError:()->() {get set}
    var bindData:()->() {get set}
    func getComicImages(resourceURI:String)
}
class DetailsViewModel :DetailsModelProtocol ,ObservableObject{
    let objectWillChange = ObjectWillChangePublisher()
    var networkService:NetworkServiceProtocol?
    
    var error:String?{
        didSet{
            bindError()
        }
    }
    var thumbnail: Thumbnail?{
        didSet {
           // bindData()
            objectWillChange.send()
        }
    }
    var bindData: () -> () = {}
    var bindError:()->() = {}
    init() {
        networkService = NetworkService()
        
    }
    
    func getComicImages(resourceURI:String){
        print("getImages func")
        (networkService?.getComics(resourseURI: resourceURI){ [weak self] (data,error) in
            if let error:Error = error {
                let message = error.localizedDescription
                self?.error = message
                print(message)
            }else {
//                if let characters = data?.results {
//                    self?.characters = characters
//                }
                self?.thumbnail = data
            }
            
            })
    }
    func getCharacterCell(from character:Character) -> CharacterCell {
        return CharacterCell(name: character.name, imagePath: character.thumbnail?.path, imageExtension: character.thumbnail?.thumExtension)
        
    }
}
