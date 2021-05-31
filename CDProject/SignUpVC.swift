//
//  SignUpVC.swift
//  CDProject
//
//  Created by Hamdi moh on 5/27/21.
//  Copyright © 2021 com.iug. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBAction func bntSignUp(_ sender: Any) {
        let storybored = UIStoryboard(name: "Main", bundle: .main)
         let HVC = storybored.instantiateViewController(identifier: "homeVCStorybord")
        HVC.modalPresentationStyle = .fullScreen
        present(HVC,animated: true,completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
