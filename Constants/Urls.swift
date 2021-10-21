//
//  Urls.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 19/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation

class URLs {
    
    static func getCharactersUrl(offset:Int) -> String{
        return "https://gateway.marvel.com:443/v1/public/characters?ts=thesoer&apikey=001ac6c73378bbfff488a36141458af2&hash=72e5ed53d1398abb831c3ceec263f18b&offset=\(offset)"
    }
    static func getSearchResults(name:String) -> String{
           return "https://gateway.marvel.com:443/v1/public/characters?ts=thesoer&apikey=001ac6c73378bbfff488a36141458af2&hash=72e5ed53d1398abb831c3ceec263f18b&nameStartsWith=\(name)"
       }
}
