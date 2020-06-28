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
    //ViewControllerからの値を受け取るプロパティ
    var sectionNumber: Int?
    var rowNumber: Int?
    //アンラップ
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch (sectionNumber, rowNumber) {
        case (0, 0):
            urlStr = "https://www.astonmartin.com/ja/models/dbx"
            openURL("https://www.astonmartin.com/ja/models/dbx")
        case (0, 1):
            urlStr = "https://www.astonmartin.com/ja/models/new-vantage"
            openURL("https://www.astonmartin.com/ja/models/new-vantage")
        case (0, 2):
            urlStr = "https://www.astonmartin.com/ja/models/db11"
            openURL("https://www.astonmartin.com/ja/models/db11")
        case (0, 3):
            urlStr = "https://www.astonmartin.com/ja/models/dbs-superleggera"
            openURL("https://www.astonmartin.com/ja/models/dbs-superleggera")
        case (0, 4):
            urlStr = "https://www.astonmartin.com/ja/models/rapide-amr"
            openURL("https://www.astonmartin.com/ja/models/rapide-amr")
        case (1, 0):
            urlStr = "https://lexus.jp/models/ls/"
            openURL("https://lexus.jp/models/ls/")
        case (1, 1):
            urlStr = "https://lexus.jp/models/gs/"
            openURL("https://lexus.jp/models/gs/")
        case (1, 2):
            urlStr = "https://lexus.jp/models/gsf/"
            openURL("https://lexus.jp/models/gsf/")
        case (1, 3):
            urlStr = "https://lexus.jp/models/es/"
            openURL("https://lexus.jp/models/es/")
        case (1, 4):
            urlStr = "https://lexus.jp/models/is/"
            openURL("https://lexus.jp/models/is/")
        default:
            return
        }
    }
    
    var urlStr: String = "aa"
    //WebサイトのURLを開くメソッド
    func openURL(_ string: String?) {
        if string != nil {
            let url = URL(string: urlStr)!
            let request = URLRequest(url: url)
            webView.load(request)
        }
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
