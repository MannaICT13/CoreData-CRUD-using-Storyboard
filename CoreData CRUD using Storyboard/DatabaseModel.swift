//
//  DatabaseModel.swift
//  CoreData CRUD using Storyboard
//
//  Created by Md Khaled Hasan Manna on 16/1/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DatabaseModel {
    
    static var dbmInstance = DatabaseModel()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func savePersonData(data : [String:String]){
        
     
        let person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context) as! Person
        person.name = data["name"]
        person.city = data["city"]
        
        do{
            
            try context.save()
            
        }catch{
            
            print("Faild to save Data")
            
        }
        
        
        
        
    }
    
    
    
}
