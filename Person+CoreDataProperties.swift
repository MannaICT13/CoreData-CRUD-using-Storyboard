//
//  Person+CoreDataProperties.swift
//  CoreData CRUD using Storyboard
//
//  Created by Md Khaled Hasan Manna on 14/7/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var city: String?
    @NSManaged public var name: String?

}
