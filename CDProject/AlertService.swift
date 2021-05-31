//
//  AlertService.swift
//  CDProject
//
//  Created by Hamdi moh on 5/28/21.
//  Copyright © 2021 com.iug. All rights reserved.
//

import UIKit

class AlertService {
    
    private init() {}
    
    static func addAlert(in hVC :UIViewController, completion : @escaping (String , String? , String?) -> Void){
        
        let alert = UIAlertController(title: "Add Line", message: nil, preferredStyle: .alert)
        alert.addTextField { (noteTF) in
            noteTF.placeholder = "Enter your note"
            
        }
        alert.addTextField{ (dateTF) in
            dateTF.placeholder = "Enter the date"
            
        }
        alert.addTextField{ (descTF) in
        descTF.placeholder = "Enter the description of your note"
    }
        
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let note = alert.textFields?.first?.text,
                let dateStign = alert.textFields?[1].text,
                let descStrign = alert.textFields?.last?.text
                
                else { return }
            
            let dateStr =  dateStign == "" ? nil : dateStign
            let descStr = descStrign == "" ? nil : descStrign
            
            completion(note,dateStr,descStr)
            
            
        }
        
        alert.addAction(action)
        hVC.present(alert,animated: true)

}
    static func updateAlert(in hVC:UIViewController,
                            updateNts: Any,
                            completion: @escaping (String,String?,String?)-> Void){
        let alert = UIAlertController(title: "Update note", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (noteTF) in
            noteTF.placeholder = "Update your note"
            noteTF.text = ""
            
        }
        
        alert.addTextField { (dateTF) in
            dateTF.placeholder = "Update date"
            dateTF.text = ""
            
        }
        
        alert.addTextField { (descTF) in
            descTF.placeholder = "Update description"
            descTF.text = ""
            
        }
        
        let action = UIAlertAction(title: "Update",style: .default) { (_) in
            guard let note = alert.textFields?.first?.text,
                let dateString = alert.textFields?[1].text,
                let descString = alert.textFields?.last?.text
                else { return }
            
            let dateStr = dateString == "" ? nil : String?(dateString)
            let descStr = descString == "" ? nil : descString
            
            completion(note, dateStr,descStr)
            
            
        }
        alert.addAction(action)
        hVC.present(alert, animated: true)
        
    }
}
