//
//  ButtonViewController.swift
//  MakeTableView
//
//  Created by 小島満天 on 2020/07/26.
//  Copyright © 2020 Manchen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import GoogleSignIn

class ButtonViewController: UIViewController, FUIAuthDelegate {

    
    @IBAction func pushButton(_ sender: Any) {
            let authViewController = self.authUI.authViewController()
            self.present(authViewController, animated: true, completion: nil)
    }
    
    var authUI: FUIAuth { get { return FUIAuth.defaultAuthUI()! } }
    //認証に使用するプロバイダの選択
    let providers: [FUIAuthProvider] = [FUIGoogleAuth(), FUIFacebookAuth(), FUIPhoneAuth(authUI: FUIAuth.defaultAuthUI()!)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //authUIのデリゲート設定
        self.authUI.delegate = self
        self.authUI.providers = providers
        
    }
    
    private func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if error == nil {
            let storyboard: UIStoryboard = self.storyboard!
            let secondView = storyboard.instantiateViewController(identifier: "view2")
            self.present(secondView, animated: true, completion: nil)
            print("ここにすらこない")
        } else {
            print("何かがおかしい")
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


