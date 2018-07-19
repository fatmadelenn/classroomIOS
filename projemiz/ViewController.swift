//
//  ViewController.swift
//  projemiz
//
//  Created by fatmadelenn on 4.05.2018.
//  Copyright © 2018 fatmadelenn. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class ViewController: UIViewController {
    var userUid: String!
    
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var sifre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "images")!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func giris(_ sender: Any) {
        if self.mail.text! != "" || self.sifre.text! != "" {
        Auth.auth().signIn(withEmail: self.mail.text!, password: self.sifre.text!){ (user, error) in
            if error == nil{
                    self.performSegue(withIdentifier: "anasayfa", sender: nil)
            }else{
                 self.hataMesaji(title: "Hata", message: "Kullanıcı Adı veya Şifre Yanlış!")
            }
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
    /*üstteki saat olan kısım gizlendi*/
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}

