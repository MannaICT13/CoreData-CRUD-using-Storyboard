//
//  ViewController.swift
//  CoreData CRUD using Storyboard
//
//  Created by Md Khaled Hasan Manna on 16/1/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveActionBtn(_ sender: UIButton) {
        
        let dic : [String : String] = ["name":txtName.text! ,"city":txtCity.text!]
        
        DatabaseModel.dbmInstance.savePersonData(data: dic)
        
        
        
        
    }
    
}

