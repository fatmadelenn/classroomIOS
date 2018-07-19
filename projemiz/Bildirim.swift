//
//  Bildirim.swift
//  projemiz
//
//  Created by fatmadelenn on 12.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import Foundation
class Bildirim{
    var bildirimYapan:String
    var bildirimMetin:String
    var tarih:Double
    var duyuruId:String
    init(duyuruId:String,bildirimYapan:String,bildirimMetin:String,tarih:Double) {
        self.duyuruId = duyuruId
        self.bildirimYapan = bildirimYapan
        self.bildirimMetin = bildirimMetin
        self.tarih = tarih
    }
}
