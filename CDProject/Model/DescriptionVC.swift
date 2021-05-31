//
//  DescriptionVC.swift
//  CDProject
//
//  Created by Hamdi moh on 5/30/21.
//  Copyright © 2021 com.iug. All rights reserved.
//

import UIKit

class DescriptionVC: UIViewController{
    
    var desc: Notes120181344!
    
    
    

    @IBOutlet weak var descLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Description screen"+"\(desc.noteDescription)")
        descLable.text = desc.noteDescription
        
        
         

        // Do any additional setup after loading the view.
    }
    


}
