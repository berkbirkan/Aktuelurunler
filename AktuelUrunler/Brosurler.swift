//
//  Brosurler.swift
//  AktuelUrunler
//
//  Created by berk birkan on 22.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit
import SideMenu
import GoogleMobileAds

class Brosurler: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var interstitial: GADInterstitial!
    
    
    @IBOutlet weak var menubutton: UIBarButtonItem!
    
    
    @IBAction func menu(_ sender: Any) {
        //present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    var brosurname = [String]()
    var brosurdate = [String]()
    var brosurimage = [String]()
    var brosurbody = [String]()
    var index = Int()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brosurname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "brosurcell", for: indexPath) as! BrosurCell
        cell.brosuradi.text = brosurname[indexPath.row]
        cell.brosurresmi.sd_setImage(with: URL(string: "http://berkbirkan.com/android_news_app/upload/"+brosurimage[indexPath.row]))
        cell.tarih.text = brosurdate[indexPath.row]
        cell.body.text = brosurbody[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100.0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tobrosur" {
            let secondvc = segue.destination as! BrosurPreview
            secondvc.body = brosurbody[index]
            secondvc.title = brosurname[index]
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "tobrosur", sender: nil)
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitial.load(request)
        tableview.delegate = self
        tableview.dataSource = self
        
        getlatestnews()
        
        
    }
    
    func getlatestnews(){
        guard let url = URL(string:"http://berkbirkan.com/android_news_app/api.php?latest_news=100") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                
                let jsonArray = jsonResponse as? [String: Any]
                let news = jsonArray!["NewsApp"] as? [[String:Any]]
                for category in news! {
                    self.brosurname.append(category["news_heading"] as! String)
                    self.brosurimage.append(category["news_image"] as! String)
                    self.brosurdate.append(category["news_date"] as! String)
                    self.brosurbody.append(category["news_description"] as! String)
                    
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
