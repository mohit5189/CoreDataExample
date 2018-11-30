//
//  User+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Mohit Kumar on 30/11/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var number_of_children: Int16
    @NSManaged public var name: String?
    @NSManaged public var dob: NSDate?
    @NSManaged public var car: NSSet?

}

// MARK: Generated accessors for car
extension User {

    @objc(addCarObject:)
    @NSManaged public func addToCar(_ value: Car)

    @objc(removeCarObject:)
    @NSManaged public func removeFromCar(_ value: Car)

    @objc(addCar:)
    @NSManaged public func addToCar(_ values: NSSet)

    @objc(removeCar:)
    @NSManaged public func removeFromCar(_ values: NSSet)

}
