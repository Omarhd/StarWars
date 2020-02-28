//
//  VehiaclesVC.swift
//  StarWars
//
//  Created by Omar on 22/02/2020.
//  Copyright © 2020 Omar. All rights reserved.
//

import UIKit

class VehiaclesVC: UIViewController, PersonProtocol {
    // outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var manufactureLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lenghtLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    // vars
    var person : Person!
    let api = VehicleApi()
    var vehicles = [String]()
    var currentVehicle = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vehicles = person.vehicleUrls
        nextBtn.isEnabled = vehicles.count > 1
        previousBtn.isEnabled = false
        
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
        
    }
    
    func getVehicle(url : String) {
        api.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setupView(vehicle: vehicle)
            }
        }
    }
    
    func setupView(vehicle : Vehicles) {
        nameLbl.text = vehicle.name
        modelLbl.text = vehicle.model
        manufactureLbl.text = vehicle.manufacturer
        costLbl.text = vehicle.cost
        lenghtLbl.text = vehicle.lenght
        speedLbl.text = vehicle.speed
        crewLbl.text = vehicle.crew
        passengersLbl.text = vehicle.passengers
    }
    
    @IBAction func previousClicked(_ sender: Any) {
        currentVehicle -= 1
        setupButtons()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        currentVehicle += 1
        setupButtons()
    }
    
    func setupButtons () {
        if currentVehicle == 0 {
            previousBtn.isEnabled = false
        } else {
            previousBtn.isEnabled = true
        }
        if currentVehicle == vehicles.count - 1 {
            nextBtn.isEnabled = false
        } else {
            nextBtn.isEnabled = true
        }
        
        getVehicle(url: vehicles[currentVehicle])
    }
}
