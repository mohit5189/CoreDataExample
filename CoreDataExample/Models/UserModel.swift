//
//  UserModel.swift
//  CoreDataExample
//
//  Created by Mohit Kumar on 30/11/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

class UserModel: NSObject {

    var name:String?
    var email:String?
    var dob:NSDate?
    var childrens:Int16?
    var cars:[CarModel]?
    
    override init() {
        self.cars = [CarModel]()
    }
}
