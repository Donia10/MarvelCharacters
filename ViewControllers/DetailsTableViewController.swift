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
    var viewModel:DetailsViewModel?
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
        print("desc = \(character?.description)")
        headerImageVirew.sd_setImage(with: URL(string: "\(character?.thumbnail?.path ?? "")/standard_small.\(character?.thumbnail?.thumExtension ?? "")"), placeholderImage: UIImage(named: "image-placeholder"))
                               
    }
    
    override func viewWillAppear(_ animated: Bool) {
     //   navigationController?.setNavigationBarHidden(true, animated: true)

       }
}
extension DetailsTableViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        if collectionView == comicsCollectionView {
            return character?.comics?.items?.count ?? 0
        }else  if collectionView == seriesCollectionView {
            return character?.series?.items?.count ?? 0
        }else  if collectionView == storiesCollectionView {
            return character?.stories?.items?.count ?? 0
        }else {
            
            return character?.events?.items?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == comicsCollectionView {
            let comicCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComicCollectionViewCell", for: indexPath) as! ComicCollectionViewCell
            comicCell.comic = character?.comics?.items?[indexPath.row]
            return comicCell
            
        }else  if collectionView == seriesCollectionView {
            let seriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeriesCollectionViewCell", for: indexPath) as! SeriesCollectionViewCell
            seriesCell.series = character?.series?.items?[indexPath.row]
            return seriesCell
            
        }else  if collectionView == storiesCollectionView {
            let storyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
            storyCell.story = character?.stories?.items?[indexPath.row]
            return storyCell
            
        }
        else{
            let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCollectionViewCell", for: indexPath) as! EventCollectionViewCell
            eventCell.event = character?.events?.items?[indexPath.row]
            return eventCell
        }
        
        
        
        
    }
    
    
}
