//
//  Constants.swift
//  StarTrivia
//
//  Created by Omar on 14/02/2020.
//  Copyright © 2020 Omar. All rights reserved.
//

import UIKit

let BlackBG = UIColor.black.withAlphaComponent(0.6).cgColor

let urlBase = "https://swapi.co/api/"
let personBaseUrl = urlBase + "people/"
let vehaciles = urlBase + "vehicles/"
//let 

typealias PersonResponseComlpetion = (Person?) -> Void
