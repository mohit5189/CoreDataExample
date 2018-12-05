//
//  User+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Mohit Kumar on 05/12/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var dob: NSDate?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var number_of_children: Int16
    @NSManaged public var car: NSSet?
    @NSManaged public var house: NSSet?

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

// MARK: Generated accessors for house
extension User {

    @objc(addHouseObject:)
    @NSManaged public func addToHouse(_ value: House)

    @objc(removeHouseObject:)
    @NSManaged public func removeFromHouse(_ value: House)

    @objc(addHouse:)
    @NSManaged public func addToHouse(_ values: NSSet)

    @objc(removeHouse:)
    @NSManaged public func removeFromHouse(_ values: NSSet)

}
