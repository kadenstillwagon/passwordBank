//
//  AccountPasswordPage.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 8/14/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import UIKit

class AccountPasswordPage: UIViewController {
    
    @IBOutlet weak var PasswordName: UILabel!
    @IBOutlet weak var Password: UITextView!
    
    @IBOutlet weak var NewPassword: UITextField!
    
    @IBOutlet weak var ChangePassView: UIView!
    
    var userAccountPasswords = [String:[String:String]]()
    var users = [String:String]()
    var names = [String:String]()
    var ciphers = [String:String]()
    var username = ""
    var password = ""
    var passIdentifier = ""
    
    
    var accountPasswordChanged = false
    
    var home = false
    
    var color1 = UIColor()
    var color2 = UIColor()
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(SignOut), userInfo: nil, repeats: false)
        
        ChangePassView.isHidden = true
        ChangePassView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        

        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        
        
        NewPassword.attributedPlaceholder = NSAttributedString(string: "New Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        PasswordName.text = passIdentifier
        Password.text = decrypt(userAccountPasswords[username]![passIdentifier]!, decryption1(ciphers[username]!))
        fitText()

        PasswordName.adjustsFontSizeToFitWidth = true
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        timer.invalidate()
        if home == true
        {
        var mainController = segue.destination as! Main
        mainController.userAccountPasswords = self.userAccountPasswords
        mainController.users = self.users
        mainController.names = self.names
        mainController.ciphers = self.ciphers
        mainController.username = self.username
        mainController.password = self.password
        mainController.accountPasswordChanged = self.accountPasswordChanged
        mainController.page = "accounts"
        }
    }
    
    func fitText()
    {
        
        //Adjusts size of password name font
        if passIdentifier.count <= 5
        {
            PasswordName.font = UIFont.systemFont(ofSize: 48)
        }
        if passIdentifier.count <= 10 && passIdentifier.count > 5
        {
            PasswordName.font = UIFont.systemFont(ofSize: 43)
        }
        if passIdentifier.count <= 15 && passIdentifier.count > 10
        {
            PasswordName.font = UIFont.systemFont(ofSize: 38)
        }
        if passIdentifier.count <= 20 && passIdentifier.count > 15
        {
            PasswordName.font = UIFont.systemFont(ofSize: 33)
        }
        if passIdentifier.count <= 25 && passIdentifier.count > 20
        {
            PasswordName.font = UIFont.systemFont(ofSize: 30)
        }
        if passIdentifier.count <= 30 && passIdentifier.count > 25
        {
            PasswordName.font = UIFont.systemFont(ofSize: 27)
        }
        if passIdentifier.count <= 35 && passIdentifier.count > 30
        {
            PasswordName.font = UIFont.systemFont(ofSize: 24)
        }
        if passIdentifier.count <= 40 && passIdentifier.count > 35
        {
            PasswordName.font = UIFont.systemFont(ofSize: 21)
        }
        
        
        
        
        //Adjusts size of password font
        if userAccountPasswords[username]![passIdentifier]!.count <= 5
        {
            Password.font = UIFont.systemFont(ofSize: 45)
        }
        if userAccountPasswords[username]![passIdentifier]!.count <= 10 && userAccountPasswords[username]![passIdentifier]!.count > 5
        {
            Password.font = UIFont.systemFont(ofSize: 40)
        }
        if userAccountPasswords[username]![passIdentifier]!.count <= 15 && userAccountPasswords[username]![passIdentifier]!.count > 10
        {
            Password.font = UIFont.systemFont(ofSize: 35)
        }
        if userAccountPasswords[username]![passIdentifier]!.count <= 20 && userAccountPasswords[username]![passIdentifier]!.count > 15
        {
            Password.font = UIFont.systemFont(ofSize: 30)
        }
        if userAccountPasswords[username]![passIdentifier]!.count <= 25 && userAccountPasswords[username]![passIdentifier]!.count > 20
        {
            Password.font = UIFont.systemFont(ofSize: 27)
        }
        if userAccountPasswords[username]![passIdentifier]!.count <= 30 && userAccountPasswords[username]![passIdentifier]!.count > 25
        {
            Password.font = UIFont.systemFont(ofSize: 24)
        }
        if userAccountPasswords[username]![passIdentifier]!.count <= 35 && userAccountPasswords[username]![passIdentifier]!.count > 30
        {
            Password.font = UIFont.systemFont(ofSize: 21)
        }
        if userAccountPasswords[username]![passIdentifier]!.count <= 40 && userAccountPasswords[username]![passIdentifier]!.count > 35
        {
            Password.font = UIFont.systemFont(ofSize: 17)
        }
    }
    
    @IBAction func DeletePassword(_ sender: UIButton) {
        
        userAccountPasswords[username]!.removeValue(forKey: passIdentifier)
        accountPasswordChanged = true
        home = true
        performSegue(withIdentifier: "AccountPassToMain", sender: self)
    }
    
    @IBAction func ResetPassword(_ sender: UIButton) {
        resetTimer()
        ChangePassView.alpha = 0
        ChangePassView.isHidden = false
        UIView.animate(withDuration: 0.6, animations: {self.ChangePassView.transform = CGAffineTransform(scaleX: 1, y: 1); self.ChangePassView.alpha = 1})
//        UIView.animate(withDuration: 1, animations: {self.ChangePassView.frame.origin.y -= 150})
//        UIView.animate(withDuration: 1, animations: {self.ChangePassView.frame.origin.x += 50})
    }
    
    @IBAction func TapRecognizer(_ sender: UITapGestureRecognizer) {
        resetTimer()
        if ChangePassView.isHidden == false
        {
            UIView.animate(withDuration: 0.6, animations: {self.ChangePassView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01); self.ChangePassView.alpha = 0}, completion: {finished in self.ChangePassView.isHidden = true})
        }
    }
    
    @IBAction func Submit(_ sender: UIButton) {
        resetTimer()
        userAccountPasswords[username]![passIdentifier]! = encrypt(NewPassword.text!, decryption1(ciphers[username]!))
        Password.text = decrypt(userAccountPasswords[username]![passIdentifier]!, decryption1(ciphers[username]!))
        accountPasswordChanged = true
        UIView.animate(withDuration: 0.6, animations: {self.ChangePassView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01); self.ChangePassView.alpha = 0}, completion: {finished in self.ChangePassView.isHidden = true})
    }
    
    
    
    @IBAction func BackToMain(_ sender: UIButton) {
        
        home = true
        performSegue(withIdentifier: "AccountPassToMain", sender: self)
    }
    
    func resetTimer()
    {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(SignOut), userInfo: nil, repeats: false)
    }
    
    @IBAction func SignOut(_ sender: UIButton) {
           
            timer.invalidate()
           view.endEditing(true)
           performSegue(withIdentifier: "ViewAccountToStart", sender: self)
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
