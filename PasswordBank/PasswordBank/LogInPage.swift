//
//  LogInPage.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 8/12/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import UIKit

class LogInPage: UIViewController {
    
    
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var SubmitButton: UIButton!
    
    @IBOutlet weak var IncorrectError: UILabel!
    
    
    var users = [String:String]()
    var names = [String:String]()
    var ciphers = [String:String]()
    
    var username = ""
    var password = ""
    var name = ""
    
    var access = false
    var toMain = false
    
    var place = "fromLogIn"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        IncorrectError.isHidden = true
        
        Username.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        Password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        Username.text = "kStillwagon"
        Password.text = "Kstill04"

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if toMain == true{
            var MainController = segue.destination as! Main
            MainController.users = self.users
            MainController.names = self.names
            MainController.ciphers = self.ciphers
            MainController.username = self.username
            MainController.password = self.password
            MainController.place = self.place
        }
    }
    
    @IBAction func LogInSubmit(_ sender: UIButton) {
        
        if users[Username.text!] != nil
        {
            if Password.text! == decrypt(users[Username.text!]!, decryption1(ciphers[Username.text!]!))
            {
                access = true
                toMain = true
                username = Username.text!
                password = Password.text!
                password = encrypt(password, decryption1(ciphers[username]!))
                performSegue(withIdentifier: "LogInToMain", sender: self)
                
            }
            
            if access == false
            {
                IncorrectError.isHidden = false
            }
            
        }
        else
        {
            IncorrectError.isHidden = false
        }
    }
    
    @IBAction func BackToMenu(_ sender: UIButton) {
        performSegue(withIdentifier: "LogInToStart", sender: self)
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
