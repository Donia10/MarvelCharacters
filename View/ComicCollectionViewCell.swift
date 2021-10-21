//
//  ComicCollectionViewCell.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 21/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit

class ComicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var comicLbl: UILabel!
    @IBOutlet weak var comicImgView: UIImageView!
    var comic:Item?{
        didSet{
            comicLbl.text = comic?.name
//            comicImgView.sd_setImage(with: URL(string: "\(comic?.imagePath ?? "")/standard_small.\(character?.imageExtension ?? "")"), placeholderImage: UIImage(named: "image-placeholder"))
            
        }
    }
}
