//
//  FilmsVC.swift
//  StarWars
//
//  Created by Omar on 22/02/2020.
//  Copyright © 2020 Omar. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {

    // outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var proLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var crawLbl: UITextView!
    
    @IBOutlet weak var preBtn: FadeEnabledBtn!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    // vars
    var person : Person!
    let api = FilmApi()
    var films = [String]()
    var curentFilm = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        films = person.filmUrls
        nextBtn.isEnabled = films.count > 1
        preBtn.isEnabled = false
        
        guard let firstFilm = films.first else { return }
        getFilm(url: firstFilm)

    }
    func getFilm(url : String) {
        api.getFilms(url: url) { (film) in
            if let film = film {
                self.setupView(film: film)
            }
        }
    }
    func setupView (film : Films) {
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode)
        directorLbl.text = film.director
        proLbl.text = film.producer
        releasedLbl.text = film.relaseData
        let stripp = film.crawl.replacingOccurrences(of: "\n", with: " ")
        crawLbl.text = stripp.replacingOccurrences(of: "\r", with: " ")
    }
    
    @IBAction func preClicked(_ sender: Any) {
        curentFilm -= 1
        setupButtons()
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        curentFilm += 1
        setupButtons()
    }
    
    func setupButtons () {
        if curentFilm == 0 {
            preBtn.isEnabled = false
        } else {
            preBtn.isEnabled = true
        }
        if curentFilm == films.count - 1 {
            nextBtn.isEnabled = false
        } else {
            nextBtn.isEnabled = true
        }
        getFilm(url: films[curentFilm])

    }
}
