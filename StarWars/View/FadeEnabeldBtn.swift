//
//  FadeEnabeldBtn.swift
//  StarWars
//
//  Created by Omar on 22/02/2020.
//  Copyright © 2020 Omar. All rights reserved.
//

import UIKit

class FadeEnabledBtn : UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
