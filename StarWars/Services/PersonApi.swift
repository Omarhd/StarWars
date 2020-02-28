//
//  PersonApi.swift
//  StarTrivia
//
//  Created by Omar on 15/02/2020.
//  Copyright © 2020 Omar. All rights reserved.
//

import Foundation
import Alamofire

class PersonApi {
    
    // web request with alamofire
    func getRandomPersonAlamo (id: Int, completion: @escaping PersonResponseComlpetion) {
        
        guard let url = URL(string: "\(personBaseUrl)\(id)") else { return }
        Alamofire.request(url).response { (response) in
            if let error = response.error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            guard let json = response.request as? [String: Any] else {return completion(nil)}
            let person = self.parsePersonManual(json: json)
            completion(person)
        }
    }
    
    
    // web request with url session
    func getRandomPersonUrlSession (id: Int, completion: @escaping PersonResponseComlpetion) {
        
        guard let url = URL(string: "\(personBaseUrl)\(id)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                print(error.debugDescription)
                completion(nil)
                return
            }
            guard let data = data else { return }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String : Any] else { return }
                let person = self.parsePersonManual(json: json)
                DispatchQueue.main.async {
                    completion(person)
                }
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        task.resume()
    }
    
    private func parsePersonManual(json: [String : Any]) -> Person{
        
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworldUrls = json["homeworlds"] as? [String] ?? [String]()
        let filmUrls = json["films"] as? [String] ?? [String]()
        let vehicleUrls = json["vehicles"] as? [String] ?? [String]()
        let starsipUrls = json["starships"] as? [String] ?? [String]()

        let person = Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworld: homeworldUrls, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starsipUrls: starsipUrls)
    
        return person
    }
}
