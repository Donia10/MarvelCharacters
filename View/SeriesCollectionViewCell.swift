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
            let viewModel = DetailsViewModel()
                       viewModel.getComicImages(resourceURI: series?.resourceURI ?? "")
                       
                       viewModel.bindData = { [weak self] in
                         guard let thumbnail = viewModel.thumbnail else {
                               return
                           }
                           self?.seriesImgView.sd_setImage(with: URL(string: "\(thumbnail.path ?? "")/standard_small.\(thumbnail.thumExtension ?? "")"), placeholderImage: UIImage(named: "image-placeholder"))
                               
                           }
                       }
        }
    
    
}
