//
//  Kullanici.swift
//  projemiz
//
//  Created by fatmadelenn on 11.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import Foundation
class Kullanici{
    var adSoyad:String
    var eMail:String
    var id:String
    init(id:String,adSoyad:String,eMail:String) {
        self.id = id
        self.adSoyad = adSoyad
        self.eMail = eMail
    }
}
