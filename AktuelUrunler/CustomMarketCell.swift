//
//  CustomMarketCell.swift
//  AktuelUrunler
//
//  Created by Konuk Kullanıcı on 23.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit

class CustomMarketCell: UITableViewCell {
    
    @IBOutlet weak var resim: UIImageView!
    
    
    @IBOutlet weak var brosuradi: UILabel!
    
    
    @IBOutlet weak var tarih: UILabel!
    
    
    @IBOutlet weak var body: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
