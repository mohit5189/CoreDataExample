//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Mohit Kumar on 30/11/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UITableViewDataSource,AddCarVCDelegate {
   
    
   

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtChildren: UITextField!
    @IBOutlet weak var txtDob: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    var carData:[CarModel]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carData = [CarModel]()
        
        let rightButton = UIBarButtonItem(title: "List", style: .plain, target: self, action: #selector(ViewController.showUsers))
        
        self.navigationItem.rightBarButtonItem = rightButton

    }

    @objc func showUsers() {
        let dataVC:UserListViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        
        self.navigationController?.pushViewController(dataVC, animated: true)

    }
    @IBAction func addCar(_ sender: Any) {
        
        let addcarVC:AddCarViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddCarViewController") as! AddCarViewController
        
        addcarVC.delegate = self
        
        self.navigationController?.pushViewController(addcarVC, animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        
        // Keeping name and email and mendatory
        guard let name = txtName.text else {
            print("Name is missing")
            return
        }
        
        guard let email = txtEmail.text else {
            print("Email is missing")
            return
        }
        
        
        if name.count>0, email.count>0{
            let user:UserModel = UserModel()
            user.name = name
            user.email = email
            user.childrens = Int16(txtChildren.text ?? "0")
            
            if let dob = txtDob.text{
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy"
                let date = dateFormatter.date(from: dob) as NSDate?
                
                user.dob = date
            }
            
            user.cars = carData
            
            CoreDataManager.sharedInstance.saveUserDetails(userModel: user)
            
            carData?.removeAll()
            
            self.tableView.reloadData()
            txtDob.text = ""
            txtChildren.text = ""
            txtEmail.text = ""
            txtName.text = ""
        }
        
    }
    
    
    // MARK: UITableViewDatasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.carData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!

        let car:CarModel? = self.carData?[indexPath.row]
        
        if let car = car{
            cell.textLabel?.text = String.init(format: "Model=%@ Year=%d", car.model ?? "", car.year ?? 0)

        }
        return cell;
    }
    
    
    // MARK: AddCarDelegate
    
    func carAdded(car: CarModel) {
        carData?.append(car)
        self.tableView.reloadData()
    }
}

