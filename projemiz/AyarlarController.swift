
//
//  AyarlarController.swift
//  projemiz
//
//  Created by fatmadelenn on 13.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class AyarlarController: UIViewController {
    @IBOutlet weak var ePosta: UILabel!
    @IBOutlet weak var Şifre: UITextField!
    @IBOutlet weak var ŞifreTekrar: UITextField!
    @IBOutlet weak var adSoyad: UILabel!
    @IBOutlet weak var rutbe: UILabel!
    var kullaniciId:String!
    var ref:DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        kullaniciBilgisiGetir()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    @IBAction func cikisYap(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        } catch let err {
            print(err)
        }

    }
    func kullaniciBilgisiGetir(){
        kullaniciId = Auth.auth().currentUser?.uid
        ref?.child("kullanicilar/"+kullaniciId).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let adSoyad = value?["adSoyad"] as? String ?? ""
            let rutbeGetir = value?["rutbe"] as? String ?? ""
            self.adSoyad.text! = adSoyad
            self.ePosta.text! = (Auth.auth().currentUser?.email)!
            self.rutbe.text! = rutbeGetir
        })
    }
    @IBAction func sifreDegistir(_ sender: Any) {
            if Şifre.text == ŞifreTekrar.text && Şifre.text != nil && ŞifreTekrar.text != nil {
                if let yeniSifre = Şifre.text as? String {
                    Auth.auth().currentUser?.updatePassword(to: yeniSifre)
                   self.hataMesaji(title: "Tebrikler!", message: "Şifre Değiştirme Başarılı")
                }
            }
            else if Şifre.text != ŞifreTekrar.text{
                self.hataMesaji(title: "Başarısız!", message: "Şifreler Birbiriyle Uyuşmuyor!")
            }
            else{
                self.hataMesaji(title: "Başarısız!", message: "Lütfen boş bırakmayınız...")
        }
    }

func hataMesaji(title:String,message:String) -> Void {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
    alert.addAction(alertAction)
    self.present(alert, animated: true, completion: nil)
}
    /*üstteki saat olan kısım gizlendi*/
    override var prefersStatusBarHidden: Bool{
        return true
    }

}
