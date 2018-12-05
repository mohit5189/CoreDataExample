//
//  CoreDataManager.swift
//  CoreDataExample
//
//  Created by Mohit Kumar on 30/11/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {

    static var sharedInstance = CoreDataManager()
    
    var managedObjectContext:NSManagedObjectContext?
    
    override init() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
         self.managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    
    func saveUserDetails(userModel:UserModel) -> Void {
        
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: self.managedObjectContext!)!

        let user:User = NSManagedObject(entity: userEntity, insertInto: self.managedObjectContext!) as! User
        
        user.email = userModel.email ?? ""
        user.dob = userModel.dob ?? nil
        user.number_of_children = userModel.childrens ?? 0
        user.name = userModel.name ?? ""
        
        
        if let cars = userModel.cars{
            
            let carEntity = NSEntityDescription.entity(forEntityName: "Car", in: self.managedObjectContext!)!

            for carModel in cars {
                let car:Car = NSManagedObject(entity: carEntity, insertInto: self.managedObjectContext!) as! Car
                
                car.model = carModel.model ?? ""
                car.year = carModel.year ?? 0
                car.company = "Test"
                user.addToCar(car)
                
            }
        }
        
        let houseEntity = NSEntityDescription.entity(forEntityName: "House", in: self.managedObjectContext!)!

        
        let house:House = NSManagedObject(entity: houseEntity, insertInto: self.managedObjectContext!) as! House
        
        house.address = "xyz"
        user.addToHouse(house)
        
        do {
            try self.managedObjectContext?.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

    }
    
    func getAllUsers() -> [UserModel] {
        
        var users:[UserModel] = [UserModel]()
        
        
        let userdData = try! managedObjectContext!.fetch(User.fetchRequest())

            for user in userdData{
                let user1 = UserModel()
                
                user1.name = (user as! User).name
                user1.email = (user as! User).email

              
                for car in ((user as! User).car?.allObjects)!{
                    
                    let car1 = CarModel()
                    
                    car1.model = (car as! Car).model
                    car1.year = (car as! Car).year
                    
                    user1.cars?.append(car1)

                }
                
                users.append(user1)
                
            }
        return users
    }
}
