//
//  CharactersModel.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 19/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation

struct Characters:Codable {
    let data :Dataa?
}

struct Dataa:Codable {
    let offset:Int?
    let total:Int?
    let results:[Character]?
}

struct Character:Codable {
    let id :Int?
    let name :String?
    let description :String?
    let thumbnail:Thumbnail?
    let comics:Comics?
    let series:Series?
    let events:Events?
    let stories:Stories?

}
struct Thumbnail:Codable {
    let path:String?
    let thumExtension:String?
    
    
    enum CodingKeys :String,CodingKey {
        case thumExtension = "extension"
        case path = "path"
        
    }
}
struct Comics:Codable {
    let available:Int?
    let returned:Int?
    let collectionURI:String?
    let items:[Item]?
}

struct Series:Codable {
    let available:Int?
    let items:[SeriesItems]?
}

struct SeriesItems:Codable {
    let resourceURI:String?
    let name:String?
    let type:String?
}
struct Stories:Codable {
    let available:Int?
    let returned:Int?
    let collectionURI:String?
    let items:[Story]?
}
struct Story:Codable {
    let resourceURI:String?
    let name:String?
    let type:String?
}
struct Item:Codable {
    let resourceURI:String?
    let name:String?
}
struct Events:Codable {
    let available:Int?
    let collectionURI:String?
    let items:[Item]?
    let returned:Int?
}
struct Url {
    let type:String?
    let url:String?
}

struct ComicsResponse:Codable {
    let data:ComicsData?
}
struct ComicsData:Codable {
    let results:[ComicResults]?
}
struct ComicResults :Codable{
    let thumbnail:Thumbnail?

}
