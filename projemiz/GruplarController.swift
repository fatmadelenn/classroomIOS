//
//  GruplarController.swift
//  projemiz
//
//  Created by fatmadelenn on 4.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class GruplarController: UIViewController,UITableViewDataSource,UIAlertViewDelegate,UITableViewDelegate {
 
    var ref:DatabaseReference?
    var kullaniciId:String!
    var grupIdkey:String!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        ref = Database.database().reference()
        kullaniciId = Auth.auth().currentUser?.uid
        var grupId = ref?.child("gruplar/").childByAutoId()
        grupIdkey = grupId?.key
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "GrupTableCell") as! GruplarTableViewCell//cellin daha önce oluşturulup oluşturulmadığını kontrol eder
        ref?.child("gruplar/"+grupIdkey!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value3 = snapshot.value as? NSDictionary
            let grup = value3?["grupAdi"] as? String ?? ""
            let olusturan = value3?["grupOlusturanId"] as? String ?? ""
            let tarih = value3?["zaman"] as? String ?? ""
            cell2.grupAdi.text! = grup
            cell2.olusturanKisi.text! = olusturan
            cell2.olusturulmaTarihi.text! = tarih
            print(grup)
        })
        return cell2
    }
    
  
    @IBAction func yeniGrupEkle(_ sender: Any) {
        let alert = UIAlertController(title: "Grup oluştur",
                                      message: "",
                                      preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "Ekle", style: .default, handler: { (action) -> Void in
            let textField = alert.textFields![0]
            if textField.text! != ""{
                self.ref?.child("gruplar/" + self.grupIdkey!+"/").setValue(["grupAdi": textField.text!,                                                                            "grupOlusturanId": self.kullaniciId,"zaman" : [".sv": "timestamp"]])
                self.hataMesaji(title: "Başarılı!", message: "Oluşturduğunuz Grup Başarıyla eklenmiştir...")
            }
        })
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
        alert.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Gru adını yazınız..."
            textField.clearButtonMode = .whileEditing
        }
        // Add action buttons and present the Alert
        alert.addAction(submitAction)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    /*üstteki saat olan kısım gizlendi*/
    override var prefersStatusBarHidden: Bool{
        return true
    }
    func hataMesaji(title:String,message:String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }


}
