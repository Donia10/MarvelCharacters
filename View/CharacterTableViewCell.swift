//
//  CharacterTableViewCell.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 19/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import UIKit
import SDWebImage
class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImgView: UIImageView!
    
    @IBOutlet weak var nameTxtView: UILabel!
    
    var character:CharacterCell? {
          didSet{
        
            nameTxtView.text = character?.name ?? "no name"
            characterImgView.sd_setImage(with: URL(string: "\(character?.imagePath ?? "")/standard_small.\(character?.imageExtension ?? "")"), placeholderImage: UIImage(named: "image-placeholder"))
            
                
            }
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        characterImgView.layer.cornerRadius = characterImgView.frame.height / 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
