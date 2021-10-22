//
//  EventCollectionViewCell.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 21/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var eventImgView: UIImageView!
    @IBOutlet weak var eventLbl: UILabel!
    var event:Item?{
        didSet{
            eventLbl.text = event?.name
            
            let viewModel = DetailsViewModel()
                       viewModel.getComicImages(resourceURI: event?.resourceURI ?? "")
                       
                       viewModel.bindData = { [weak self] in
                         guard let thumbnail = viewModel.thumbnail else {
                               return
                           }
                           self?.eventImgView.sd_setImage(with: URL(string: "\(thumbnail.path ?? "")/standard_small.\(thumbnail.thumExtension ?? "")"), placeholderImage: UIImage(named: "image-placeholder"))
                               
                           
                       }
        }
    }
}
