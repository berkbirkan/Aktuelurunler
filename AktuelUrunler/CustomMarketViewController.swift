//
//  CustomMarketViewController.swift
//  AktuelUrunler
//
//  Created by Konuk Kullanıcı on 23.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit
import SDWebImage
import PMJSON
import GoogleMobileAds


class CustomMarketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var brosurname = [String]()
    var brosurdate = [String]()
    var brosurbody = [String]()
    var brosurimage = [String]()
    var brosurid = [String]()
    var indexs = Int()
    var denemeinter: GADInterstitial!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brosurname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "custommarket", for: indexPath) as! CustomMarketCell
        cell.brosuradi.text = brosurname[indexPath.row]
        cell.tarih.text = brosurdate[indexPath.row]
        cell.resim.sd_setImage(with: URL(string: "http://berkbirkan.com/android_news_app/upload/" + brosurimage[indexPath.row]))
        cell.body.text = brosurbody[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        indexs = indexPath.row
        performSegue(withIdentifier: "frommarkettobrosur", sender: self)
        
        if denemeinter.isReady {
            denemeinter.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100.0)
    }
    
    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    var catid = String()
    var marketname = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        denemeinter = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        denemeinter.load(request)
        
        tableview.delegate = self
        tableview.dataSource = self
        self.title = marketname
        
        getdatafromjsonformarket()
        
        

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let secondvc = segue.destination as! BrosurPreview
        secondvc.body = brosurbody[indexs]
        secondvc.title = brosurname[indexs]
        
        
    }
    
    
    
    
    func getdatafromjsonformarket(){
        
        guard let url = URL(string:"http://berkbirkan.com/android_news_app/api.php?cat_id="+catid) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [.allowFragments])
                
                let jsonArray = jsonResponse as? [String: Any]
                let news = jsonArray!["NewsApp"] as? [[String:Any]]
                
                for item in news!{
                    self.brosurname.append(item["news_heading"] as! String)
                    self.brosurdate.append(item["news_heading"] as! String)
                    self.brosurbody.append(item["news_description"] as! String)
                    self.brosurimage.append(item["news_image"] as! String)
                    self.brosurid.append(item["nid"] as! String)
                    
                }
                
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
        
    }
    

    

}
