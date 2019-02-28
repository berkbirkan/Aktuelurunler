//
//  Magazalar.swift
//  AktuelUrunler
//
//  Created by berk birkan on 22.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit
import SDWebImage

class Magazalar: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var menubutton: UIBarButtonItem!
    
    
    var categoryname = [String]()
    var categoryimage = [String]()
    var categoryid = [String]()
    var index = Int()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "marketcell", for: indexPath) as! MarketCell
        cell.marketname.text = categoryname[indexPath.row]
        cell.catimage.sd_setImage(with: URL(string: "http://berkbirkan.com/android_news_app/upload/category/"+categoryimage[indexPath.row]))
        cell.catid.text = categoryid[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        self.performSegue(withIdentifier: "tobrosurs", sender: nil)
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        
        getdatafromjson()
        print(categoryname)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "tobrosurs"{
            var secondcontroller = segue.destination as! CustomMarketViewController
            secondcontroller.catid = categoryid[index]
            secondcontroller.marketname = categoryname[index]
        }
        
    }
    
    func getdatafromjson(){
        guard let url = URL(string:"http://berkbirkan.com/android_news_app/api.php") else {return}
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
                    let catname = category["category_name"] as! String
                    let catimage = category["category_image"] as! String
                    let catid = category["cid"] as! String
                    
                    self.categoryname.append(catname)
                    self.categoryimage.append(catimage)
                    self.categoryid.append(catid)
                    
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
