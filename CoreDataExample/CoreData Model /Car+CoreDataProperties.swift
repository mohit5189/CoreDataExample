//
//  Car+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Mohit Kumar on 30/11/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var year: Int16
    @NSManaged public var model: String?
    @NSManaged public var user: User?

}
