//
//  Person+CoreDataProperties.swift
//  CoreData CRUD using Storyboard
//
//  Created by Md Khaled Hasan Manna on 16/1/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var city: String?

}
