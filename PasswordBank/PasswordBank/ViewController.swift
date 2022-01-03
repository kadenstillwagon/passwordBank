//
//  ViewController.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 8/12/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var users = [String:String]()
    var names = [String:String]()
    var ciphers = [String:String]()
    
    var username = ""
    var password = ""
    var name = ""
    
    var LogIn = false
    var SignUp = false
    var newUser = false
    
    
    @IBOutlet weak var NewUserMessage: UILabel!
    
    @IBOutlet weak var LogInButton: UIButton!
    @IBOutlet weak var SignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        var message = "kstillwagon22@brophybroncos.orgkStillwagon22@brophybroncos.org"
//
//        var cipher = createCipher()
//        var encrypted = encrypt(message, cipher)
//        var decrypted = decrypt(encrypted, cipher)
//
//        print(decrypted)
        
    
        
        NewUserMessage.isHidden = true
        if newUser == true
        {
            NewUserMessage.isHidden = false
            newUser = false
        }
        
        if let a = UserDefaults.standard.object(forKey: "users") as? [String:String]
        {
            users = a
        }
        
        if let b = UserDefaults.standard.object(forKey: "names") as? [String:String]
        {
            names = b
        }
        
        if let c = UserDefaults.standard.object(forKey: "ciphers") as? [String:String]
        {
            ciphers = c
        }
        
//        for user in users
//        {
//            ciphers[user.key] = encryption5(createCipher())
//        }
//        UserDefaults.standard.set(ciphers, forKey: "ciphers")
//
//        users["kStillwagon"] = "Kstill04"
//        names["kStillwagon"] = "Kaden Stillwagon"
//
//
//        for user in users
//        {
//            users[user.key] = encrypt(users[user.key]!, decryption1(ciphers[user.key]!))
//        }
//        UserDefaults.standard.set(users, forKey: "users")
//
//        for user in names
//        {
//            names[user.key] = encrypt(names[user.key]!, decryption1(ciphers[user.key]!))
//        }
//        UserDefaults.standard.set(names, forKey: "names")

        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
//        gradient.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor, UIColor.lightGray]
        gradient.colors = [UIColor(named: "color11")!.cgColor, UIColor(named: "color19")!.cgColor]
//        gradient.colors = [#colorLiteral(red: 0, green: 0.5725490196, blue: 0.2705882353, alpha: 1).cgColor, UIColor(red: 252/255, green: 238/255, blue: 33/255, alpha: 1).cgColor]
        gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        
       
        LogInButton.layer.cornerRadius = 10
        LogInButton.layer.borderWidth = 2
        LogInButton.layer.borderColor = UIColor.black.cgColor
        
        SignUpButton.layer.cornerRadius = 10
        SignUpButton.layer.borderWidth = 2
        SignUpButton.layer.borderColor = UIColor.black.cgColor
        
//        let gradient2 = CAGradientLayer()
//        gradient2.frame = LogInButton.bounds
//        gradient2.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor]
//        gradient2.shouldRasterize = true
//        gradient2.startPoint = CGPoint(x: 0, y: 0.5)
//        gradient2.endPoint = CGPoint(x: 1, y: 0.5)
//        LogInButton.layer.insertSublayer(gradient2, at: 0)
        
        
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImage.image = UIImage(named: "lockImage1")
//        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
//        self.view.insertSubview(backgroundImage, at: 0)
                
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        UserDefaults.standard.set(users, forKey: "users")
        UserDefaults.standard.set(names, forKey: "names")
        UserDefaults.standard.set(ciphers, forKey: "ciphers")
        
        if LogIn == true
        {
            var LogInController = segue.destination as! LogInPage
            LogInController.users = self.users
            LogInController.names = self.names
            LogInController.ciphers = self.ciphers
            LogInController.username = self.username
            LogInController.password = self.password
            LogInController.name = self.name
        }
        if SignUp == true
        {
            var SignUpController = segue.destination as! SignUpPage
            SignUpController.users = self.users
            SignUpController.names = self.names
            SignUpController.ciphers = self.ciphers
            SignUpController.username = self.username
            SignUpController.password = self.password
            SignUpController.name = self.name
        }
    }
    
    @IBAction func LogInSelect(_ sender: UIButton) {
        LogIn = true
    }
    
    @IBAction func SignUpSelect(_ sender: UIButton) {
        SignUp = true
    }
    
    


}

