//
//  ShowViewController.swift
//  CoreData CRUD using Storyboard
//
//  Created by Md Khaled Hasan Manna on 16/1/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var person = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        person = DatabaseModel.dbmInstance.getPersonData()

        // Do any additional setup after loading the view.
    }
    

    

}
extension ShowViewController : UITableViewDataSource,UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return person.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        cell.lblName.text = person[indexPath.row].name
        cell.lblCity.text = person[indexPath.row].city
        
        return cell;
    }
    
    
}
