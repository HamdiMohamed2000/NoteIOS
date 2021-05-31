//
//  ViewController.swift
//  CDProject
//
//  Created by Hamdi moh on 5/27/21.
//  Copyright © 2021 com.iug. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func btnSignup(_ sender: Any) {
        performSegue(withIdentifier: "signUpSegue", sender: self)
    }
    
    @IBAction func btnSignin(_ sender: Any) {
        performSegue(withIdentifier: "SignInSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

