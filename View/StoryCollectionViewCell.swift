//
//  StoryCollectionViewCell.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 21/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var storyImView: UIImageView!
    @IBOutlet weak var storyLblView: UILabel!
    var story:Story?{
        didSet{
            storyLblView.text = story?.name
            let viewModel = DetailsViewModel()
                       viewModel.getComicImages(resourceURI: story?.resourceURI ?? "")
                       
                       viewModel.bindData = { [weak self] in
                         guard let thumbnail = viewModel.thumbnail else {
                               return
                           }
                           self?.storyImView.sd_setImage(with: URL(string: "\(thumbnail.path ?? "")/standard_small.\(thumbnail.thumExtension ?? "")"), placeholderImage: UIImage(named: "image-placeholder"))
                               
                           
                       }
        }
    }
    
}
