//
//  InsertButton.swift
//  projemiz
//
//  Created by fatmadelenn on 8.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import UIKit

class InsertButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }

}
