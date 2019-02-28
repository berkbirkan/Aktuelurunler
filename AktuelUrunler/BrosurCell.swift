//
//  BrosurCell.swift
//  AktuelUrunler
//
//  Created by berk birkan on 22.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit

class BrosurCell: UITableViewCell {
    
    @IBOutlet weak var body: UILabel!
    
    
    @IBOutlet weak var brosurresmi: UIImageView!
    
    
    @IBOutlet weak var brosuradi: UILabel!
    
    
    @IBOutlet weak var tarih: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
