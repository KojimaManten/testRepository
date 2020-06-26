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
    }
    //TableViewとコードの関連付け
    @IBOutlet weak var tableView: UITableView!
    
    //画面遷移
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let sectionNumber = indexPath.section
        let rowNumber = indexPath.row
        
        if rowNumber == 0 {
            cell.textLabel?.text = "セクション\(sectionNumber + 1)"
            cell.backgroundColor = .lightGray
        } else {
            cell.textLabel?.text = "\(rowNumber)番"
        }
        return cell
    }
    
    //セルがタップされたときの処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "next") as! NextViewController
        self.present(nextView, animated: true, completion: nil)
    }
}
