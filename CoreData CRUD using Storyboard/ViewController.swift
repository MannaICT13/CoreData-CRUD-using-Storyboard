//
//  ViewController.swift
//  CoreData CRUD using Storyboard
//
//  Created by Md Khaled Hasan Manna on 16/1/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class ViewController: UIViewController,PassData {
    

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    @IBAction func saveActionBtn(_ sender: UIButton) {
        
        let dic : [String : String] = ["name":txtName.text! ,"city":txtCity.text!]
        
        if(isUpdate){
            
            DatabaseModel.dbmInstance.updateData(data: dic, index: i)
            

            txtName.text?.removeAll()
            txtCity.text?.removeAll()
            
        }else{
        
        
        DatabaseModel.dbmInstance.savePersonData(data: dic)
        
        
        txtName.text?.removeAll()
        txtCity.text?.removeAll()
        
        }
        
        
        
        
    }
    
    @IBAction func showActionBtn(_ sender: UIButton) {
        
        let showVC = self.storyboard?.instantiateViewController(identifier: "ShowViewController") as! ShowViewController
        showVC.delegate = self
        self.navigationController?.pushViewController(showVC, animated: true)
        
        
    }
    
    
    func dataPassing(data: [String : String],index:Int,isEdit:Bool) {
        txtName.text = data["name"]
        txtCity.text = data["city"]
        i = index
        isUpdate = isEdit
        
    }
    
    
    
    
}

