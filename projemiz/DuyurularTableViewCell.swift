//
//  DuyurularTableViewCell.swift
//  projemiz
//
//  Created by fatmadelenn on 7.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import UIKit
import Firebase
class DuyurularTableViewCell: UITableViewCell {
    @IBOutlet weak var begen: UIImageView!
    
    @IBOutlet weak var begeniSayisi: UILabel!
    @IBOutlet weak var cellAdSoyad: UILabel!
    @IBOutlet weak var cellMetin: UILabel!
    @IBOutlet weak var cellTarih: UILabel!
    var begenImage: [UIImage] = []
    var kullaniciId:String!
    var postKey:String!
    var duyuru: Duyuru!
    var begeniKey:String!
    var temp = false
    var temp2 = false
    var ref:DatabaseReference?
    override func awakeFromNib() {
        begenImage = imageDizisi(total: 24, imagePrefix: "heart")
         kullaniciId = Auth.auth().currentUser?.uid
        ref = Database.database().reference().child("duyurular/")
        postKey = ref?.key
    }
    func imageDizisi(total: Int,imagePrefix:String)->[UIImage]{
        var imageDizi : [UIImage] = []
        for imageSayisi in 0..<total{
            let imageName = "\(imagePrefix)-\(imageSayisi).png"
            let image = UIImage(named: imageName)!
            imageDizi.append(image)
        }
        return imageDizi
    }
    func animate(imageView: UIImageView, images: [UIImage]){
        imageView.animationImages = images
        imageView.animationDuration = 1.0
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
    @IBAction func begenButton(_ sender: Any) {
        animate(imageView: begen, images: begenImage)
        
        self.begeniKey = Database.database().reference().child("begeni").childByAutoId().key
        let like=Database.database().reference().child("begeni").child(begeniKey)
        self.temp = false
        Database.database().reference().child("begeni").observe(.value, with: { (snapshot) in
            // Get user value
            for gelenBegeni in snapshot.children.allObjects{
                let snapGelen = gelenBegeni as? DataSnapshot
                let NSbegeni = snapGelen?.value as? NSDictionary
                
                let duyuru = NSbegeni?["duyuruId"] as! String
                let kisi = NSbegeni?["kullaniciId"] as! String
                if duyuru == self.postKey && kisi == self.kullaniciId {
                    self.temp = true
                }
            }
            if !self.temp {
                like.setValue([ "duyuruId" : self.postKey ,
                                "kullaniciId" :self.kullaniciId ,
                                "zaman" :[".sv": "timestamp"]])
            }
        })
        
    }
    }
   
