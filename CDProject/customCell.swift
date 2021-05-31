//
//  customCell.swift
//  CDProject
//
//  Created by Hamdi moh on 5/28/21.
//  Copyright © 2021 com.iug. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {
  
    var onClick: OnClickItem!
    
    @IBOutlet weak var noteLable: UILabel!
    
    @IBOutlet weak var dateLable: UILabel!
    
    var n: Notes120181344!

    @IBAction func btnDesc(_ sender: Any) {
        onClick.onClick(note: n)
    }
    
    func configure(with CDProject: Notes120181344){
            n = CDProject
        dateLable.text = CDProject.date
        noteLable.text = CDProject.note
        

    }

    
}

protocol  OnClickItem {
    func onClick(note:Notes120181344)


}
