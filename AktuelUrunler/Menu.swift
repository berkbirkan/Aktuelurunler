//
//  Menu.swift
//  AktuelUrunler
//
//  Created by berk birkan on 25.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit
import StoreKit

class Menu: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "menucell", for: indexPath) as! MenuCell
        if indexPath.row == 0 {
            cell.resim.image = resizeImage(image: UIImage(named: "home")!, targetSize: CGSize(width: 30, height: 30))
            cell.baslik.text = "Anasayfa"
        }else if indexPath.row == 1{
            cell.resim.image = resizeImage(image: UIImage(named: "takip")!, targetSize: CGSize(width: 30, height: 30))
            cell.baslik.text = "Takip Listem"
        }else if indexPath.row == 2{
            cell.resim.image = resizeImage(image: UIImage(named: "rate2")!, targetSize: CGSize(width: 30, height: 30))
            cell.baslik.text = "Oyla"
        }else if indexPath.row == 3{
            cell.resim.image = resizeImage(image: UIImage(named: "other2")!, targetSize: CGSize(width: 30, height: 30))
            cell.baslik.text = "Diğer"
        }else if indexPath.row == 4 {
            cell.resim.image = resizeImage(image: UIImage(named: "info2")!, targetSize: CGSize(width: 30, height: 30))
            cell.baslik.text = "Hakkında"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            //Anasayfa
            self.performSegue(withIdentifier: "tohome", sender: nil)
        }else if indexPath.row == 1{
            //Takip
        }else if indexPath.row == 2 {
            //rate
            if #available( iOS 10.3,*){
                SKStoreReviewController.requestReview()
            }else{
                print("old ios version")
            }
        }else if indexPath.row == 3{
            //other
            
        }else if indexPath.row == 4 {
            //info
            self.performSegue(withIdentifier: "toinfo", sender: nil)
            
        }
    }
    
    
    @IBOutlet weak var tableview: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height *      widthRatio)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    

  

}
