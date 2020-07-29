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
import Firebase
import FirebaseUI
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
        var authUI: FUIAuth { get { return FUIAuth.defaultAuthUI()! } }
        //認証に使用するプロバイダの選択
        let providers: [FUIAuthProvider] = [FUIGoogleAuth(), FUIFacebookAuth(), FUIPhoneAuth(authUI: FUIAuth.defaultAuthUI()!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        searchBar.delegate = self
        
        //authUIのデリゲート設定
        self.authUI.delegate = self
        self.authUI.providers = providers
        
        //Nibをコードで定義
        //カスタムセルを登録
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        
        //認証画面を最初に出す
        let authViewController = authUI.authViewController()
        self.present(authViewController, animated: true, completion: nil)
        
        //リクエスト実行
        sendRequest()
    }
    
    
    //[Articles]のインスタンス化
    var articles: [Article]?
    // リクエストの定義！！！
    private func sendRequest(_ searchText: String? = nil)  {
        let request = FetchQiitaArticleRequest(baseURL: URL(string: "https://qiita.com/api/v2")!, query: searchText)
        
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
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //rowの設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articles = articles else { return 0 }
        return articles.count
    }
    
    //cellの中身を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        //cell.thumbView.image = UIImage(named: "")
        cell.thumbView.kf.setImage(with: URL(string: "https://pbs.twimg.com/profile_images/1201406146822557696/ewFFvnAa_400x400.jpg")!)
        if let articles = articles {
            cell.titleLabel.text = articles[indexPath.row].title
        }
        return cell
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
       if let articles = articles {
           nextViewController.nextURL = articles[indexPath.row].url
       }
        //画面遷移実行
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
       // search(searchText)
        sendRequest(searchText)
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
            searchBar.endEditing(true)
        }
    }
}

extension ViewController: FUIAuthDelegate {
//    private func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
//        if error == nil {
//            print("あいうえお")
//        } else {
//            print("かきくけこ")
//        }
//    }
}

//extension ViewController: FUIAuthDelegate {
//    public func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
//        if error == nil {
//            let storyboard: UIStoryboard = self.storyboard!
//            let viewController = storyboard.instantiateViewController(withIdentifier: "view2") as! ViewController
//            self.present(viewController, animated: true)
//            sendRequest()
//        }
//    }
//}
