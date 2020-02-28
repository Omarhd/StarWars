//
//  RoundedView.swift
//  StarTrivia
//
//  Created by Omar on 14/02/2020.
//  Copyright © 2020 Omar. All rights reserved.
//

import UIKit

class RoundedShadowView : UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = BlackBG
        layer.cornerRadius = 10
    }
}

class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = BlackBG
        layer.cornerRadius = 10
    }
}
