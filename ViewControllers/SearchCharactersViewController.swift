//
//  SearchCharactersViewController.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 20/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class SearchCharactersViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var charTableView: UITableView!
    @IBOutlet weak var cancelBtn: UIButton!
    var searchViewModel:SearchViewModelProtocol?
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        searchBar.rx.text.orEmpty.throttle(RxTimeInterval.seconds(2), scheduler: MainScheduler.instance)
        .subscribe{(_) in
            self.searchViewModel?.search(name:self.searchBar.text ?? "")

               }.disposed(by: disposeBag)
        
         searchViewModel = SearchViewModel()
                searchViewModel?.dataObservable.drive(charTableView.rx.items(cellIdentifier: "SearchTableViewCell")){row,element,cell in
                    cell.selectionStyle = .none

                    (cell as? SearchTableViewCell)?.charCell = CharacterCell(name: element.name, imagePath: element.thumbnail?.path, imageExtension: element.thumbnail?.thumExtension)
                   print("updateTableView")
                
                }.disposed(by:disposeBag )
        charTableView.rx.modelSelected(Character.self).subscribe{
            [weak self] (selectedCharacter) in
            guard let details = (self?.storyboard?.instantiateViewController(withIdentifier: "DetailsCharacterViewController")) as? DetailsCharacterViewController
                        else {return}
            self?.navigationController?.pushViewController(details, animated: true)
            
        }.disposed(by: disposeBag)
        
        charTableView.rx.setDelegate(self).disposed(by:disposeBag)
        
        cancelBtn.rx.tap.subscribe{(_) in
            self.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)

    }

    override func viewWillAppear(_ animated: Bool) {
                navigationController?.setNavigationBarHidden(true, animated: true)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
   **/
    
    

}
extension SearchCharactersViewController :UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
