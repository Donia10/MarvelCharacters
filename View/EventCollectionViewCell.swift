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
        }
    }
}
