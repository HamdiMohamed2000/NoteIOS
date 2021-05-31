//
//  HomeVC.swift
//  CDProject
//
//  Created by Hamdi moh on 5/27/21.
//  Copyright © 2021 com.iug. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var notes:[Notes120181344] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate =  self
       // self.tableView.rowHeight = 44
        
       tableView.register(UINib(nibName: "customCell", bundle: .main), forCellReuseIdentifier: "CustomCell")

        // Do any additional setup after loading the view.
        fetchData()
    }
    
    @IBAction func btnAddNote(_ sender: Any) {
        AlertService.addAlert(in: self) { (note, dateStr, descStr) in
            print(note,dateStr,descStr)
            
            let newLine = Notes120181344(context: self.context)
            
            newLine.date = dateStr
            newLine.note = note
            newLine.noteDescription = descStr ?? ""
            
            do{
                try self.context.save()
                
            }catch{
                print("Erorr : " + "\(error)")
            }
            self.fetchData()
            
        }
    }
    
    fileprivate func fetchData(){
        do {
            self.notes = try context.fetch(Notes120181344.fetchRequest())
            
            DispatchQueue.main.async {
                print("Items print" + " \(self.notes)")
                self.tableView.reloadData()
            }
        }catch{
        }
    }
      var des: Notes120181344!


}

extension HomeVC : UITableViewDataSource,UITableViewDelegate, OnClickItem{
  
    func onClick(note:Notes120181344) {
        print("Note  \(note.description)")
        
        
        let vc = self.storyboard?.instantiateViewController(identifier: "DescriptionVC") as! DescriptionVC
                vc.desc = note

                self.present(vc, animated: true, completion: nil)


            
        }


        

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! customCell
        cell.onClick = self
       
        
        cell.configure(with: notes[indexPath.row])
        
    
        
        return cell
    }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                   
                   let updateNote = notes[indexPath.row]
                   AlertService.updateAlert(in: self, updateNts: updateNote) {
                       (note,dateStr,descStr) in
                       updateNote.note = note
                       updateNote.date = dateStr
                       updateNote.noteDescription = descStr

                       do{
                           try self.context.save()
                       }catch{

                       }
                       self.fetchData()

                   }
      }
      

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
               print("Delete error")
                  guard editingStyle == .delete else { return }
                  let lineToRemove = self.notes[indexPath.row]

                  do{
                      try self.context.delete(lineToRemove)
                  }catch{
                      print("Delete Error" + "\(error)")
                  }
                  self.fetchData()
}
}

    


