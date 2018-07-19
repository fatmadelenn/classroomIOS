//
//  ImageBorderRadius.swift
//  projemiz
//
//  Created by fatmadelenn on 4.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import UIKit

class ImageBorderRadius: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.width / 2
    }

}
