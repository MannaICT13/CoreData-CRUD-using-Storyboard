//
//  ShowViewController.swift
//  CoreData CRUD using Storyboard
//
//  Created by Md Khaled Hasan Manna on 16/1/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

protocol PassData {
    
    func dataPassing(data : [String:String],index : Int,isEdit: Bool)
}

class ShowViewController: UIViewController,UISearchBarDelegate,UISearchControllerDelegate,UISearchResultsUpdating{

    
    @IBOutlet weak var tableView: UITableView!
    
    var person = [Person]()
    
    var delegate:PassData!
    
    var searchData = [String:String]()
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        person = DatabaseModel.dbmInstance.getPersonData()

        loadData()
     createSearchbar()
    }
    
    func loadData(){
        person = DatabaseModel.dbmInstance.getPersonData()
        
        
    }
    
    
    private func createSearchbar(){
        
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self as UISearchResultsUpdating
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        
    }
    
    
     public func updateSearchResults(for searchController: UISearchController) {
        
           guard let searchText = searchController.searchBar.text else{return}
        
        if searchText == ""{
          
            loadData()
               
           }else{
           
            loadData()
            person = person.filter({
                        //($0.name?.contains(searchText))!
                ($0.name?.localizedCaseInsensitiveContains(searchText))! ||
                    ($0.city?.localizedCaseInsensitiveContains(searchText))!
                    })
           }
           
        tableView.reloadData()
       }
    

}


extension ShowViewController : UITableViewDataSource,UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return person.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        cell.lblName.text = person[indexPath.row].name
        cell.lblCity.text = person[indexPath.row].city
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
      
        return true
        
    }
    
    /*func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            self.person.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            DatabaseModel.dbmInstance.deletePersonData(index: indexPath.row)

            
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dic = ["name":person[indexPath.row].name,"city":person[indexPath.row].city]
        
        delegate.dataPassing(data: dic as! [String : String])
        
        self.navigationController?.popViewController(animated: true)
    }
    */
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
     let delete = UIContextualAction(style: .destructive, title: "Delete") { (deleteAction, view, nil) in
    
        self.person.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        DatabaseModel.dbmInstance.deletePersonData(index: indexPath.row)
        
        
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (editAction, view, nil) in
            
            let dic = ["name":self.person[indexPath.row].name,"city":self.person[indexPath.row].city]
            self.delegate.dataPassing(data: dic as! [String : String],index: indexPath.row, isEdit: true)
            self.navigationController?.popViewController(animated: true)
        }
        
        let config = UISwipeActionsConfiguration(actions: [delete,edit])
        config.performsFirstActionWithFullSwipe = false
        return config
        
    }
    
    
    
}
