//
//  RadiusButton.swift
//  projemiz
//
//  Created by fatmadelenn on 6.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import UIKit

class RadiusButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 15
    }

}
