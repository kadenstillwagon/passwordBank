//
//  SignUpPage.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 8/12/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import UIKit


class SignUpPage: UIViewController {
    
    @IBOutlet weak var WarningLabel: UILabel!
    @IBOutlet weak var UsernameNotAvailableWarning: UILabel!
    @IBOutlet weak var NotSupportedWarning: UILabel!
    
    
    var users = [String:String]()
    var names = [String:String]()
    var ciphers = [String:String]()
    
    var username = ""
    var password = ""
    var name = ""
    
    var newUser = true
   
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var SubmitButton: UIButton!
    
    @IBOutlet var MainPage: UIView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        WarningLabel.isHidden = true
        UsernameNotAvailableWarning.isHidden = true
        NotSupportedWarning.isHidden = true
        
        let gradient = CAGradientLayer()
         gradient.frame = view.bounds
         gradient.colors = [UIColor(named: "color11")!.cgColor, UIColor(named: "color19")!.cgColor]
         gradient.shouldRasterize = true
         gradient.startPoint = CGPoint(x: 0, y: 0)
         gradient.endPoint = CGPoint(x: 1, y: 1)
         view.layer.insertSublayer(gradient, at: 0)
        
        
         SubmitButton.layer.cornerRadius = 10
         SubmitButton.layer.borderWidth = 1
         SubmitButton.layer.borderColor = UIColor.black.cgColor
         
        
        Name.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        Username.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        Password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        
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

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var FirstController = segue.destination as! ViewController
        FirstController.users = self.users
        FirstController.names = self.names
        FirstController.ciphers = self.ciphers
        FirstController.username = self.username
        FirstController.password = self.password
        FirstController.name = self.name
        FirstController.newUser = self.newUser
    }
    
    @IBAction func SubmitSignUp(_ sender: UIButton) {
        username = Username.text!
        password = Password.text!
        name = Name.text!
        var access = true
        var supported = true
        var dictionary = codeE(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144)
        for character in name
        {
            if dictionary.isSupported(String(character)) == false
            {
                supported = false
            }
        }
        for character in password
        {
            if dictionary.isSupported(String(character)) == false
            {
                supported = false
            }
        }
        if supported == true
        {
            for key in users.keys
            {
                if key == username
                {
                    access = false
                }
            }
            if name.count > 0 && username.count > 7 && password.count > 7 && access == true
            {
                users[username] = password
                names[username] = name
                
                var cipher = createCipher()
                ciphers[username] = cipher
                
                users[username] = encrypt(password, cipher)
                names[username] = encrypt(name, cipher)
                ciphers[username] = encryption5(ciphers[username]!)
                
                UserDefaults.standard.set(users, forKey: "users")
                UserDefaults.standard.set(names, forKey: "names")
                UserDefaults.standard.set(ciphers, forKey: "ciphers")
                
                WarningLabel.isHidden = true
                
                performSegue(withIdentifier: "SignUpToFirst", sender: self)
            }
            else if name.count == 0 || username.count < 7 || password.count < 7 && access == true
            {
                WarningLabel.isHidden = false
                UsernameNotAvailableWarning.isHidden = true
            }
            else if access == false
            {
                UsernameNotAvailableWarning.isHidden = false
                WarningLabel.isHidden = true

            }
        }
        else
        {
            NotSupportedWarning.isHidden = false
        }
    }

    
//    func encryptAll(_ users: Dictionary<String, String>, _ names: Dictionary<String, String>, _ ciphers: Dictionary<String, String>) -> (Dictionary<String, String>, Dictionary<String, String>)
//    {
//        var Users = users
//        var Names = names
//        for user in users
//        {
//            var key = user.key
//
//            var encrypted = encrypt(users[key]!, ciphers[key]!)
//
//            Users[key] = encrypted
//        }
//
//        for name in names
//        {
//            var key = name.key
//
//            var encrypted = encrypt(names[key]!, ciphers[key]!)
//
//            Names[key] = encrypted
//        }
//
//        return (Users, Names)
//    }
//
//    func decryptAll(_ users: Dictionary<String, String>, _ names: Dictionary<String, String>, _ ciphers: Dictionary<String, String>) -> (Dictionary<String, String>, Dictionary<String, String>)
//    {
//        var Users = users
//        var Names = names
//        for user in users
//        {
//            var key = user.key
//
//            var decrypted = decrypt(users[key]!, ciphers[key]!)
//
//            Users[key] = decrypted
//        }
//
//        for name in names
//        {
//            var key = name.key
//
//            var decrypted = decrypt(names[key]!, ciphers[key]!)
//
//            Names[key] = decrypted
//        }
//
//        return (Users, Names)
//    }
    
    
    
    @IBAction func BackToMenu(_ sender: UIButton) {
        newUser = false
        performSegue(withIdentifier: "SignUpToFirst", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool{
        
        textfield.resignFirstResponder()
        return (true)
    }
        
    @IBAction func endNamef(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
