//
//  SearchViewModel.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 21/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol SearchViewModelProtocol {
    //driver
    var dataObservable:Driver<[Character]>{get}
    func search(name:String)
}

class SearchViewModel :SearchViewModelProtocol{
    var dataObservable: Driver<[Character]>
        private var dataSubject = PublishSubject<[Character]>()
         var characters :[Character]?
         var networkservice :NetworkServiceProtocol!
      
      init() {
            dataObservable = dataSubject.asDriver(onErrorJustReturn: characters ?? [])
            self.networkservice = NetworkService()
            
        }
      
    func search(name:String) {
        
        networkservice.getSearchResults(name: name, completion: {
         [weak self]   (characters,error) in
            if let error:Error = error {
                let message = error.localizedDescription
                
            }else{
                
                self?.characters = characters
                self?.dataSubject.onNext(self?.characters ?? [])
            }
            
        })
       
      }
      
}
