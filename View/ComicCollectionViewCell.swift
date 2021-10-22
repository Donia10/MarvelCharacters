//
//  ComicCollectionViewCell.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 21/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit

class ComicCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var comicLbl: UILabel!
    @IBOutlet private weak var comicImgView: UIImageView!
    var comic:Item?{
        didSet{
            comicLbl.text = comic?.name
            let viewModel = DetailsViewModel()
            viewModel.getComicImages(resourceURI: comic?.resourceURI ?? "")
            
            viewModel.bindData = { [weak self] in
              guard let thumbnail = viewModel.thumbnail else {
                    return
                }
                self?.comicImgView.sd_setImage(with: URL(string: "\(thumbnail.path ?? "")/standard_small.\(thumbnail.thumExtension ?? "")"), placeholderImage: UIImage(named: "image-placeholder"))
                    
                }
            }
    }
}
