//
//  ViewController.swift
//  a211HelloAuth
//
//  Created by 申潤五 on 2020/12/19.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
        //監聽登入狀態
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user{
                //登入成功時執行的項目
                print("MSG: 登入狀態 ")
            }else{
                //登出時執行的項目
                print("MSG: 未登入狀態 ")
            }
            
        }

        
    }

    @IBAction func login(_ sender: Any) {
        Auth.auth().signInAnonymously { (user, error) in
            if error != nil {
                print("MSG:" + error!.localizedDescription)
            }else{
                print("MSG:" + user.debugDescription)
            }
        }
    }
    
    @IBAction func logout(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
        } catch  {
            print("MSG 登出失敗")
        }
        
    }
}

