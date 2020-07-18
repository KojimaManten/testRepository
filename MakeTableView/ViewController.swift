//
//  ViewController.swift
//  MakeTableView
//
//  Created by 小島満天 on 2020/06/22.
//  Copyright © 2020 Manchen. All rights reserved.
//

import UIKit
import Kingfisher
import APIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sendRequest()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        searchBar.delegate = self
        
        //Nibをコードで定義
        //カスタムセルを登録
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    var articles: [Article]?
    
    private func sendRequest()  {
        let request = FetchQiitaArticleRequest(baseURL: URL(string: "https://qiita.com/api/v2")!)
        
            Session.send(request) { result in
                switch result {
                case .success(let response):
                    //self.viewModel.articles = response
                    print(response)
                    self.articles = response
                    self.tableView.reloadData()

                case .failure(let error):
                    print(error)
                }
            }
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
            guard let articles = articles else { return 0 }
                return articles.count
            
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
        //cell.thumbView.image = UIImage(named: "")
        cell.thumbView.kf.setImage(with: URL(string: "https://pbs.twimg.com/profile_images/1201406146822557696/ewFFvnAa_400x400.jpg")!)
        
        
        switch indexPath.section {
        case 0:
            //cell.textLabel?.text = astonName[indexPath.row]
            if let articles = articles {
                cell.titleLabel.text = articles[indexPath.row].title
            }
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
            if let articles = articles {
                nextViewController.nextURL = articles[indexPath.row].url
            }
        case 1:
            nextViewController.nextURL = lexusURL[indexPath.row]
        default:
            return
        }
        //画面遷移実行
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        search(searchText)
    }
    
    func search(_ text: String) {
        var newArray: [Article] = []
        if articles != nil {
            articles?.forEach({
                if $0.title.contains(text) {
                    newArray.insert($0, at: 0)
                } else {
                    newArray.append($0)
                }
            })
            articles = newArray
            tableView.reloadData()
        }
    }
}
