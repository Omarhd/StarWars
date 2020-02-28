//
//  BlackBgView.swift
//  StarWars
//
//  Created by Omar on 22/02/2020.
//  Copyright © 2020 Omar. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    
    override func awakeFromNib() {
        
        layer.backgroundColor = BlackBG
        layer.cornerRadius = 10
    }
}
class RoundedButton: UIButton {
    
    override func awakeFromNib() {
        
        layer.backgroundColor = BlackBG
        layer.cornerRadius = 10
    }
}
