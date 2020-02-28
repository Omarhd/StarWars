//
//  StarShipsVC.swift
//  StarWars
//
//  Created by Omar on 22/02/2020.
//  Copyright © 2020 Omar. All rights reserved.
//

import UIKit

class StarShipsVC: UIViewController, PersonProtocol {
    
    // outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var capLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var pasLbl: UILabel!
    
    @IBOutlet weak var preBtn: FadeEnabledBtn!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    
    // vars
    var person : Person!
    let api = StarshipsApi()
    var starship = [String]()
    var currentShip = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        
        starship = person.starshipUrls
        nextBtn.isEnabled = starship.count > 1
        preBtn.isEnabled = false
        
        guard let firstStarship = starship.first else { return }
        getStarship(url: firstStarship)
        
    }
    
    func getStarship(url : String) {
        api.getVehicle(url: url) { (starship) in
            if let starship = starship {
                self.setupView(starship: starship)
            }
        }
    }
    
    func setupView(starship : Starships) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makerLbl.text = starship.manufacturer
        costLbl.text = starship.cost
        lengthLbl.text = starship.lenght
        capLbl.text = starship.capacity
        crewLbl.text = starship.crew
        pasLbl.text = starship.passengers
    }
    
    @IBAction func peviousClicked(_ sender: Any) {
        currentShip -= 1
        setupButtons()
    }
    @IBAction func nextClicked(_ sender: Any) {
        currentShip += 1
        setupButtons()
    }
    
    func setupButtons () {
        if currentShip == 0 {
            preBtn.isEnabled = false
        } else {
            preBtn.isEnabled = true
        }
        if currentShip == starship.count - 1 {
            nextBtn.isEnabled = false
        } else {
            nextBtn.isEnabled = true
        }
        
        getStarship(url: starship[currentShip])
    }
}



