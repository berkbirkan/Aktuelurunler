//
//  InfoTableViewCell.swift
//  AktuelUrunler
//
//  Created by berk birkan on 25.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var resim: UIImageView!
    
    
    @IBOutlet weak var baslik: UILabel!
    
    @IBOutlet weak var aciklama: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
