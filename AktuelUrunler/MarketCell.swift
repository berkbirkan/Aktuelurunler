//
//  MarketCell.swift
//  AktuelUrunler
//
//  Created by berk birkan on 22.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit

class MarketCell: UITableViewCell {
    
    @IBOutlet weak var catimage: UIImageView!
    
    
    @IBOutlet weak var marketname: UILabel!
    
    
    
    @IBOutlet weak var catid: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
