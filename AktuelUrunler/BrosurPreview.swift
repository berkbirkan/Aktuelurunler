//
//  BrosurPreview.swift
//  AktuelUrunler
//
//  Created by Konuk Kullanıcı on 23.02.2019.
//  Copyright © 2019 Turansoft. All rights reserved.
//

import UIKit

class BrosurPreview: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    
    
    var body = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview.loadHTMLString(body, baseURL: nil)

        
    }
    

}
