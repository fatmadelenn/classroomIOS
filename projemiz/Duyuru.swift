//
//  Duyuru.swift
//  projemiz
//
//  Created by fatmadelenn on 10.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import Foundation
import Firebase
class Duyuru{
    var duyuruIcerik:String
    var duyuruYapan:String
    var tarih:Double
    var postKey:String
    init(postKey:String,duyuruIcerik:String,duyuruYapan:String,tarih:Double) {
        
        self.postKey = postKey
        self.duyuruIcerik = duyuruIcerik
        self.duyuruYapan = duyuruYapan
        self.tarih = tarih
    }
}
