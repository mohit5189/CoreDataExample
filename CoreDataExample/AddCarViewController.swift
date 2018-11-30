//
//  AddCarViewController.swift
//  CoreDataExample
//
//  Created by Mohit Kumar on 30/11/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

protocol AddCarVCDelegate{
    func carAdded(car:CarModel) -> Void
}

class AddCarViewController: UIViewController {

    @IBOutlet weak var txtCarModel: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    
     var delegate:AddCarVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addCar(_ sender: Any) {
        
        guard let model = txtCarModel.text else{
            return
        }
        
        guard let year = txtYear.text else {
            return
        }
        
        let carModel:CarModel = CarModel()
        carModel.year = Int16(year)
        carModel.model = model
        
        self.delegate?.carAdded(car: carModel)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
