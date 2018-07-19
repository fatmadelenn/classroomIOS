//
//  BildirimlerTableViewCell.swift
//  projemiz
//
//  Created by fatmadelenn on 12.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import UIKit

class BildirimlerTableViewCell: UITableViewCell {
    @IBOutlet weak var bildirimAdsoyad: UILabel!
    @IBOutlet weak var bildirimTarih: UILabel!
    @IBOutlet weak var bildirimMetin: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
