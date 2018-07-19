//
//  UyeOlController.swift
//  projemiz
//
//  Created by fatmadelenn on 4.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class UyeOlController: UIViewController {

    
    @IBOutlet weak var rutbe: UISegmentedControl!
    @IBOutlet weak var sifreTekrar: UITextField!
    @IBOutlet weak var sifre: UITextField!
    @IBOutlet weak var kullaniciAdi: UITextField!
    @IBOutlet weak var adSoyad: UITextField!
    
    var ref:DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "uyeBackground")!)
         ref=Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func uyeOl(_ sender: Any) {
        
        if self.adSoyad.text! != "" || self.kullaniciAdi.text! != "" || self.sifre.text! != "" || self.sifreTekrar.text! != "" {
             if self.sifre.text!==self.sifreTekrar.text!{
                Auth.auth().createUser(withEmail: self.kullaniciAdi.text!, password: self.sifre.text!) { (user, error) in
                    if error == nil {

                                self.ref=self.ref?.child("kullanicilar/"+(user?.uid)!+"/")
                                var rutbeAdi = ""
                                switch self.rutbe.selectedSegmentIndex{
                                case 0:
                                    rutbeAdi="Öğrenci"
                                    break
                                case 1:
                                    rutbeAdi="Akademisyen"
                                    break
                                default:
                                    break
                                }
                        let user = [ "adSoyad" : self.adSoyad.text!,"rutbe":rutbeAdi,"eMail" : self.kullaniciAdi.text!]
                                self.ref?.setValue(user)
                                self.hataMesaji(title: "Başarılı", message: "Kaydınız tamamlandı.")
                    }else{
                        self.hataMesaji(title: "Hata", message: "Kayıt başarısız")
                    }
                    
                    
                    
                    
                }
            }else{
                self.hataMesaji(title: "Hata", message: "Şifreler uyumsuz!")
            }
        }else{
            self.hataMesaji(title: "Hata", message: "Boş alan bırakmayınız!")
        }
    }
    func hataMesaji(title:String,message:String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }

}
