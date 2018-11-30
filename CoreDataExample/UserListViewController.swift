//
//  UserListViewController.swift
//  CoreDataExample
//
//  Created by Mohit Kumar on 30/11/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController,UITableViewDataSource {
   
    

    @IBOutlet weak var tableView: UITableView!
    
    var users:[UserModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        users = [UserModel]()
        
        users = CoreDataManager.sharedInstance.getAllUsers()
        
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        
        let user:UserModel? = self.users?[indexPath.row]
        
        if let user = user{
            cell.textLabel?.text = String.init(format: "Name=%@ Email=%@", user.name ?? "", user.email ?? "")

            if let cars = user.cars{
               
                var str = ""
                for car in cars{
                    
                    str.append(String.init(format: "M=%@ Y=%d | ", car.model ?? "", car.year ?? 0))
                    
                }
                
                cell.detailTextLabel?.text = str

            }
           
            
        }
        return cell;
    }

}
