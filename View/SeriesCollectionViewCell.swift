//
//  SeriesCollectionViewCell.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 21/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit

class SeriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var seriesImgView: UIImageView!
    @IBOutlet weak var serieLbl: UILabel!
    var series:Item?{
        didSet{
            serieLbl.text = series?.name
        }
    }
    
}
