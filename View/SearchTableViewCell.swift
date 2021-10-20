//
//  SearchTableViewCell.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 20/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet private weak var viewCell: UIView!
    @IBOutlet private weak var CharImage: UIImageView!
    @IBOutlet private weak var charNameLbl: UILabel!
    
    var charCell:CharacterCell?{
        didSet{
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
