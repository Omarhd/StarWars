//
//  ViewController.swift
//  StarWars
//
//  Created by Omar on 21/02/2020.
//  Copyright © 2020 Omar. All rights reserved.
//

import UIKit

class PersonVC: UIViewController {
    
    // outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var hightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthdateLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    @IBOutlet weak var homeWorldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starShipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    
    
    // vars
    var personApi = PersonApi()
    var person : Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func RandomClicked(_ sender: Any) {
        
            // swapi api got just 87 persons
            let random = Int.random(in : 1 ... 87)
        activity.startAnimating()
            personApi.getRandomPersonAlamo(id: random) { (person) in
                if let person = person {
                    self.activity.stopAnimating()
                    self.setupView(person: person)
                    self.person = person
                    
                }
            }
        }
    func setupView (person : Person) {
        nameLbl.text = person.name
        hightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthdateLbl.text = person.birthYear
        genderLbl.text = person.gender
        
        homeWorldBtn.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        starShipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
    }
}
    
protocol PersonProtocol {
    var person: Person! {get set}
}
