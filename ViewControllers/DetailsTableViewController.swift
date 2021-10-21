//
//  DetailsTableViewController.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 21/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit

class DetailsTableViewController: UITableViewController {

    @IBOutlet weak var headerImageVirew: UIImageView!
    @IBOutlet weak var charTitleLbl: UILabel!
    @IBOutlet weak var charDescriptionLbl: UILabel!
    @IBOutlet weak var comicsCollectionView: UICollectionView!
    
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    @IBOutlet weak var seriesCollectionView: UICollectionView!
    
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    var character:Character?
    override func viewDidLoad() {
        super.viewDidLoad()
        comicsCollectionView.delegate = self
        comicsCollectionView.dataSource = self
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        seriesCollectionView.delegate = self
        seriesCollectionView.dataSource = self
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        
        charTitleLbl.text = character?.name
        charDescriptionLbl.text = character?.description
        
        
        

    }

   
}
extension DetailsTableViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.comicsCollectionView {
            return 5
        }else if collectionView == self.eventsCollectionView {
                   return 5
        }else if collectionView == self.seriesCollectionView {
                   return 5
        }else if collectionView == self.storiesCollectionView {
                   return 5
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.comicsCollectionView{
        let comicCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComicCollectionViewCell", for: indexPath) as! ComicCollectionViewCell
        return comicCell
            
        } else if collectionView == self.eventsCollectionView {
             let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCollectionViewCell", for: indexPath) as! EventCollectionViewCell
            return eventCell
        
        }else if collectionView == self.eventsCollectionView {
             let storyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
            return storyCell
       }
        else if collectionView == self.seriesCollectionView {
            let seriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeriesCollectionViewCell", for: indexPath) as! SeriesCollectionViewCell
            return seriesCell
        }
        else {
            return UICollectionViewCell()
        }

        
        
         
    }
    
    
}
