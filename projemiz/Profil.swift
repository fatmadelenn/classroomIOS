//
//  Profil.swift
//  projemiz
//
//  Created by fatmadelenn on 11.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import UIKit

class Profil: UIView {

    override public func layoutSubviews() {
        super.layoutSubviews()
        roundCorners([.bottomRight, .topRight], radius: 300)
    }
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
