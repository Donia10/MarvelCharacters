//
//  CharactersViewController.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 19/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit
import SwiftUI

class CharactersViewController: UIViewController {
    @IBOutlet private weak var charactersTableView: UITableView!
    @IBOutlet weak var loadMoreActivityIndicator: UIActivityIndicatorView!
    private var viewModel:CharactersViewModelProtocol?
    private var charactersList=[Character]()
    private var offset = 0
    private var total:Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        charactersTableView.delegate = self
        charactersTableView.dataSource = self
        setupData()
        
    }

    func setupData() {
        viewModel = CharactersViewModel()
        viewModel?.getCharacters(offset: offset)
        viewModel?.bindCharactersToView = onDataSuccessUpdateView
        
    }
    func onDataSuccessUpdateView(){
//        guard let characters = viewModel?.characters else {
//            return
//        }
//        for character in characters {
//            self.charactersList.append(character)
//        }
//
//        charactersTableView.reloadData()
        guard let characters = viewModel?.data?.results else { return  }
        for character in characters {
                    self.charactersList.append(character)
                }
        guard let total = viewModel?.data?.total else { return  }
        self.total = total
                charactersTableView.reloadData()
        loadMoreActivityIndicator.isHidden = true
        print("DataSuccess\(self.charactersList.count)")

        
    }

}
extension CharactersViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = charactersTableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as! CharacterTableViewCell
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        cell.selectionStyle = .none
        cell.character = viewModel?.getCharacterCell(from: charactersList[indexPath.row])
        print("cellforRowAt")
        return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       print("willDisplay")

        if indexPath.row == charactersList.count - 1 {
            loadMoreActivityIndicator.isHidden = false
                  if charactersList.count < total ?? 0 {
                                 //       loadMore.startAnimating()
                                 offset = offset + 20
                                 viewModel?.getCharacters(offset: offset)
                                 viewModel?.bindCharactersToView = onDataSuccessUpdateView
                             print(" count is \(charactersList.count)")
                             }
                         }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let details = (storyboard?.instantiateViewController(withIdentifier:"DetailsTableViewController")) as? DetailsTableViewController
//                    else {return}
//        details.character = charactersList[indexPath.row]
//        navigationController?.pushViewController(details, animated: true)
        
        // Navigate to host
        let host = UIHostingController(rootView: CharacterDetails(character: charactersList[indexPath.row]))
        
        navigationController?.pushViewController(host, animated: true)
    }
}
