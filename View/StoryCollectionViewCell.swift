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
    var story:Item?{
        didSet{
            storyLblView.text = story?.name
        }
    }
    
}
