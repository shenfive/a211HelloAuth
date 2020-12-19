//
//  ViewController.swift
//  a211HelloAuth
//
//  Created by 申潤五 on 2020/12/19.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().signInAnonymously { (user, error) in
            if error != nil {
                print(error?.localizedDescription)
            }else{
                print(user.debugDescription)
            }
        }
    }


}

