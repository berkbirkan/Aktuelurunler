//
//  InfoViewController.swift
//  AktuelUrunler
//
//  Created by berk birkan on 25.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit
import StoreKit

class InfoViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "infocell", for: indexPath) as! InfoTableViewCell
        if indexPath.row == 0{
            cell.resim.image = UIImage(named: "home")
            cell.baslik.text = "Uygulama Adı"
            cell.aciklama.text = "Aktuel Urunler"
        }else if indexPath.row == 1{
            cell.resim.image = UIImage(named: "info")
            cell.baslik.text = "Build Versionu"
            cell.aciklama.text = "1.0"
            
        }else if indexPath.row == 2{
            cell.resim.image = UIImage(named: "email")
            cell.baslik.text = "Eposta"
            cell.aciklama.text = "info@simgemedya.net"
        }else if indexPath.row == 3{
            cell.resim.image = UIImage(named: "info")
            cell.baslik.text = "Telif Hakkı"
            cell.aciklama.text = "Copyright 2019 SimgeMedya"
        }else if indexPath.row == 4{
            cell.resim.image = UIImage(named: "rate")
            cell.baslik.text = "Oyla"
            cell.aciklama.text = "Geribildirim gönderin"
        }else if indexPath.row == 5{
            cell.resim.image = UIImage(named: "other")
            cell.baslik.text = "Diğer"
            cell.aciklama.text = "Diğer uygulamalarımız"
        }
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            if #available( iOS 10.3,*){
                SKStoreReviewController.requestReview()
            }else{
                print("old ios version")
            }
        }else if indexPath.row == 5{
            if let url = URL(string: "itms-apps://itunes.apple.com/us/developer/berk-birkan/id1245561630"),
                UIApplication.shared.canOpenURL(url)
            {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
    
    
    @IBOutlet weak var tableview: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self

       
    }
    

    

}
