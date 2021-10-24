//
//  NetworkService.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 19/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation
import Alamofire


protocol NetworkServiceProtocol {
    func getCharacters(offset:Int,completion: @escaping (Dataa?, Error?) -> ())
    func getSearchResults(name:String,completion: @escaping ([Character]?, Error?) -> ())
    func getImage(resourseURI:String,completion: @escaping (Thumbnail?, Error?) -> ())
}
class NetworkService :NetworkServiceProtocol{
    func getCharacters(offset:Int,completion: @escaping (Dataa?, Error?) -> ()) {
        
        AF.request(URLs.getCharactersUrl(offset: offset)).validate().responseDecodable(of: Characters.self) { (response) in

               switch response.result {
                   case .success( _):

                    guard let data = response.value?.data else { return }
                    completion(data, nil)

                   case .failure(let error):

                       print(error)
                       completion(nil, error)
               }
           }
       }
    func getSearchResults(name:String,completion: @escaping ([Character]?, Error?) -> ()) {
     
     AF.request(URLs.getSearchResults(name: name)).validate().responseDecodable(of: Characters.self) { (response) in

            switch response.result {
                case .success( _):

                    guard let data = response.value?.data?.results else { return }
                 completion(data, nil)

                case .failure(let error):

                    print(error)
                    completion(nil, error)
            }
        }
    }
    func getImage(resourseURI:String,completion: @escaping (Thumbnail?, Error?) -> ()) {
          
          AF.request(URLs.getImage(resourseUrI: resourseURI)).validate().responseDecodable(of: ComicsResponse.self) { (response) in

                 switch response.result {
                     case .success( _):

                        guard let image = response.value?.data?.results?[0].thumbnail else { return }
                      completion(image, nil)

                     case .failure(let error):

                         print(error)
                         completion(nil, error)
                 }
             }
         }
}
