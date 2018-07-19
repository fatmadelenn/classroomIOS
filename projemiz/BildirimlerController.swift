//
//  BildirimlerController.swift
//  projemiz
//
//  Created by fatmadelenn on 4.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class BildirimlerController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var bildirimler = [Bildirim]()
    var kullaniciId:String!
    var ref:DatabaseReference?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        kullaniciId = Auth.auth().currentUser?.uid
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        bildirimleriGetir()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func bildirimleriGetir(){
        ref = Database.database().reference()
        ref?.child("begeni").observe(.value, with: {(snapshot) in
            self.bildirimler.removeAll()
            for gelen in snapshot.children.allObjects {
                let begen = gelen as? DataSnapshot
                let gelenbegeni = begen?.value as? NSDictionary
                let begenen = gelenbegeni!["kullaniciId"] as! String
                let duyurum = gelenbegeni!["duyuruId"] as! String
      /*tarih*/ let zaman = gelenbegeni!["zaman"] as! Double
                Database.database().reference().child("duyurular").observe(.value, with: {(snapshot) in
                    for begeniGelen in snapshot.children.allObjects {
                        let duyuru = begeniGelen as? DataSnapshot
                        let gelenDuyuru = duyuru?.value as? NSDictionary
                        let key = duyuru?.key
                        let duyuruYapan = gelenDuyuru!["duyuruYazan"] as! String
                        print(duyuruYapan)
                        if self.kullaniciId == duyuruYapan && key == duyurum {
                            //self.begenenCount = self.begenenCount + 1
                            let bildirimKaydet = Bildirim(duyuruId: key!, bildirimYapan: begenen, bildirimMetin: "beğendi", tarih: zaman)
                            self.bildirimler.append(bildirimKaydet)
                        }
                    }
                    self.bildirimler.reverse()
                    self.tableView.reloadData()
                })
            }
        })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*kaç satır*/
        return bildirimler.count
    }
    /*tableviewin seçme özelliğini kapatmak için*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*satır satır alır*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "bildirimlerTableViewCell") as! BildirimlerTableViewCell
        ref = Database.database().reference()
        ref?.child("kullanicilar").child(bildirimler[indexPath.row].bildirimYapan).observeSingleEvent(of: .value, with: {(snapshot) in
            let kullanici = snapshot.value as? NSDictionary
            cell.bildirimAdsoyad.text! = (kullanici!["adSoyad"] as? String)!
        })
        let gelenTarih = timestampCevirme(serverTimestamp: bildirimler[indexPath.row].tarih)
        cell.bildirimTarih.text! = gelenTarih
        return cell
    }
    /*Timestamp i tarihe çevirmek*/
    func timestampCevirme(serverTimestamp: Double) -> String {
        let x = serverTimestamp / 1000
        let date = NSDate(timeIntervalSince1970: x)
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        
        return formatter.string(from: date as Date)
    }
    /*üstteki saat olan kısım gizlendi*/
    override var prefersStatusBarHidden: Bool{
        return true
    }
    

}
