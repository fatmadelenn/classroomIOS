//
//  GruplarTableViewCell.swift
//  projemiz
//
//  Created by fatmadelenn on 8.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class GruplarTableViewCell: UITableViewCell {

    @IBOutlet weak var grupAdi: UILabel!
    @IBOutlet weak var olusturanKisi: UILabel!
    @IBOutlet weak var olusturulmaTarihi: UILabel!
    var grupIdkey:String!
    var ref:DatabaseReference?
    override func awakeFromNib() {
        super.awakeFromNib()
        ref = Database.database().reference()
        
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    
}
