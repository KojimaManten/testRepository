//
//  ViewController.swift
//  MakeTableView
//
//  Created by 小島満天 on 2020/06/22.
//  Copyright © 2020 Manchen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //Nibをコードで定義
        //カスタムセルを登録
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
    }
    //TableViewとコードの関連付け
    @IBOutlet weak var tableView: UITableView!
    
    //必要うなデータ追加
    let makerName = ["AstonMartin", "Lexus"]
    let astonName = ["DBX", "VANTAGE","DBS SUPERLEGGERA", "RAPIDE AMR"]
    let lexusName = ["LS", "GS", "GSF", "ES", "IS"]
    let astonURL = ["https://www.astonmartin.com/ja/models/dbx", "https://www.astonmartin.com/ja/models/new-vantage", "https://www.astonmartin.com/ja/models/db11", "https://www.astonmartin.com/ja/models/dbs-superleggera", "https://www.astonmartin.com/ja/models/rapide-amr"]
    let lexusURL = ["https://lexus.jp/models/ls/", "https://lexus.jp/models/gs/", "https://lexus.jp/models/gsf/", "https://lexus.jp/models/es/", "https://lexus.jp/models/is/"]
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //rowの設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return astonName.count
        case 1:
            return lexusName.count
        default:
            return 0
        }
    }
    //cellの中身を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        switch indexPath.section {
        case 0:
            //cell.textLabel?.text = astonName[indexPath.row]
            cell.titleLabel.text = astonName[indexPath.row]
            
        case 1:
           // cell.textLabel?.text = lexusName[indexPath.row]
            cell.titleLabel.text = lexusName[indexPath.row]
        default:
            return cell
        }
        return cell
    }
    //sectionの数追加
    func numberOfSections(in tableView: UITableView) -> Int {
        return makerName.count
    }
    //sectionのタイトル追加
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return makerName[section]
    }
    //セルがタップされたときの処理を追加（画面遷移）
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Next.Storyboardをインスタンス化
        let storyboard: UIStoryboard = UIStoryboard(name: "Next", bundle: nil)
        //NextViewControllerをインスタンス化
        guard let nextViewController = storyboard.instantiateInitialViewController() as? NextViewController else {
            return
        }
        //画面遷移時に値を渡す
        switch indexPath.section {
        case 0:
            nextViewController.nextURL = astonURL[indexPath.row]
        case 1:
            nextViewController.nextURL = lexusURL[indexPath.row]
        default:
            return
        }
        //画面遷移実行
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
