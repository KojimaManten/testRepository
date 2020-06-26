//
//  NextViewController.swift
//  MakeTableView
//
//  Created by 小島満天 on 2020/06/26.
//  Copyright © 2020 Manchen. All rights reserved.
//

import UIKit
import WebKit

class NextViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //String型からURLに変換
        guard let url = URL(string: "https://youtu.be/IPMmEEix8F8") else { return }
        //URLからURLRequestに変換
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
