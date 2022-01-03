//
//  AccountEditPage.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 12/23/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import UIKit

class AccountEditPage: UIViewController {
    
    var users = [String:String]()
    var names = [String:String]()
    var ciphers = [String:String]()
    
    var username = ""
    var password = ""
    
    var usernameChange = false
    var passwordChange = false
    var accountDelete = false
    
    var timer = Timer()

    var color1 = UIColor()
    var color2 = UIColor()
    
    var userAccountPasswords = [String:[String:String]]()
    var userDevicePasswords = [String:[String:String]]()
    var userCardPasswords = [String:[String:[String]]]()
    var userInfoPasswords = [String:[String:String]]()
    
    
    @IBOutlet weak var ChangePasswordLabel: UILabel!
    @IBOutlet weak var ChangeUsernameLabel: UILabel!
    @IBOutlet weak var DeleteAccountLabel: UILabel!
    
    
    @IBOutlet weak var EnterNewPassCommand: UILabel!
    @IBOutlet weak var EnterNewUsernameCommand: UILabel!
    
    
    @IBOutlet weak var ChangePasswordStackView: UIStackView!
    @IBOutlet weak var ChangeUsernameStackView: UIStackView!
    @IBOutlet weak var DeleteAccountStackView: UIStackView!
    
    
    @IBOutlet weak var NewPassword: UITextField!
    @IBOutlet weak var NewUsername: UITextField!
    
    @IBOutlet weak var PasswordSubmit: UIButton!
    @IBOutlet weak var UsernameSubmit: UIButton!
    
    
    @IBOutlet weak var AuthenticationView: UIView!
    
    @IBOutlet weak var IncorrectErrorMessage: UILabel!
    
    
    @IBOutlet weak var UsernameCheck: UITextField!
    @IBOutlet weak var PasswordCheck: UITextField!
    
    @IBOutlet weak var authenticationSubmit: UIButton!
    
    @IBOutlet weak var NewPasswordWarning: UILabel!
    @IBOutlet weak var NewUsernameWarning: UILabel!
    
    
    
    var home = false
    
    var usernameChanged = false
    var passwordChanged = false
    var accountDeleted = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(SignOut), userInfo: nil, repeats: false)//starts timer
        home = false
        
        let gradient = CAGradientLayer()//sets background
        gradient.frame = view.bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        
        
        NewUsername.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        NewPassword.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        UsernameCheck.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        PasswordCheck.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        EnterNewPassCommand.isHidden = true
        EnterNewUsernameCommand.isHidden = true

        
        NewPasswordWarning.isHidden = true//hides warning labels
        NewUsernameWarning.isHidden = true
        IncorrectErrorMessage.isHidden = true
        
        AuthenticationView.isHidden = false
        
        
        if usernameChange == true{//determines if changing username or password
            
            ChangePasswordLabel.isHidden = true
            ChangeUsernameLabel.isHidden = false
            DeleteAccountLabel.isHidden = true
            
            ChangePasswordStackView.isHidden = true
            ChangeUsernameStackView.isHidden = false
            DeleteAccountStackView.isHidden = true
        }
        
        
        if passwordChange == true{
            
            ChangePasswordLabel.isHidden = false
            ChangeUsernameLabel.isHidden = true
            DeleteAccountLabel.isHidden = true
            
            ChangePasswordStackView.isHidden = false
            ChangeUsernameStackView.isHidden = true
            DeleteAccountStackView.isHidden = true
        }
        
        
        if accountDelete == true{
            ChangePasswordLabel.isHidden = true
            ChangeUsernameLabel.isHidden = true
            DeleteAccountLabel.isHidden = false
            
            ChangePasswordStackView.isHidden = true
            ChangeUsernameStackView.isHidden = true
            DeleteAccountStackView.isHidden = false
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        timer.invalidate()
        usernameChange = false
        passwordChange = false
        accountDelete = false
        if home == true
        {
        var mainController = segue.destination as! Main
        mainController.usernameChange = self.usernameChange
        mainController.passwordChange = self.passwordChange
        mainController.accountDelete = self.accountDelete
        mainController.users = self.users
        mainController.names = self.names
        mainController.ciphers = self.ciphers
        mainController.username = self.username
        mainController.password = self.password
        mainController.usernameChanged = self.usernameChanged
        mainController.passwordChanged = self.passwordChanged
        mainController.page = "accounts"
        }
    }
    
    
    @IBAction func authenticationSubmit(_ sender: UIButton) {
        resetTimer()
        var access = false
        if users[UsernameCheck.text!] != nil
        {
            if PasswordCheck.text! == decrypt(users[UsernameCheck.text!]!, decryption1(ciphers[UsernameCheck.text!]!))
            {
                access = true
                UIView.animate(withDuration: 0.6, animations: {self.AuthenticationView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01); self.AuthenticationView.alpha = 0}, completion: {finished in self.AuthenticationView.isHidden = true})
                
                if usernameChange == true{
                    EnterNewPassCommand.isHidden = true
                    EnterNewUsernameCommand.isHidden = false
                }
                if passwordChange == true{
                    EnterNewPassCommand.isHidden = false
                    EnterNewUsernameCommand.isHidden = true
                }
            }
            else
            {
                IncorrectErrorMessage.isHidden = false
            }
        }
        else
        {
            IncorrectErrorMessage.isHidden = false
        }
        
    }
    
    
    
    @IBAction func NewPasswordSubmit(_ sender: UIButton) {
        if NewPassword.text!.count > 7
        {
            password = NewPassword.text!
            password = encrypt(password, decryption1(ciphers[username]!))
            users[username] = password
            UserDefaults.standard.set(users, forKey: "users")
            home = true
            performSegue(withIdentifier: "AccountEditToMain", sender: self)
        }
        else{
            NewPasswordWarning.isHidden = false
        }
    }
    
    @IBAction func NewUsernameSubmit(_ sender: UIButton) {
        if NewUsername.text!.count > 7
        {
            var oldName = names[username]
            var oldAccounts = userAccountPasswords[username]
            var oldDevices = userDevicePasswords[username]
            var oldCards = userCardPasswords[username]
            var oldInfo = userInfoPasswords[username]
            
            names.remove(at: names.index(forKey: username)!)
            users.remove(at: users.index(forKey: username)!)
            userAccountPasswords.removeValue(forKey: username)
            userDevicePasswords.removeValue(forKey: username)
            userCardPasswords.removeValue(forKey: username)
            userInfoPasswords.removeValue(forKey: username)
            
            username = NewUsername.text!
            
            names[username] = oldName
            users[username] = password
            userAccountPasswords[username] = oldAccounts
            userDevicePasswords[username] = oldDevices
            userCardPasswords[username] = oldCards
            userInfoPasswords[username] = oldInfo
            
            
            UserDefaults.standard.set(users, forKey: "users")
            UserDefaults.standard.set(names, forKey: "names")
            UserDefaults.standard.set(userAccountPasswords, forKey: "userAccountPasswords")
            UserDefaults.standard.set(userDevicePasswords, forKey: "userDevicePasswords")
            UserDefaults.standard.set(userCardPasswords, forKey: "userCardPasswords")
            UserDefaults.standard.set(userInfoPasswords, forKey: "userInfoPasswords")
            home = true
            performSegue(withIdentifier: "AccountEditToMain", sender: self)
        }
        else{
            NewUsernameWarning.isHidden = false
        }
    }
    
    @IBAction func DeleteAccountSubmit(_ sender: UIButton) {
        
        names.remove(at: names.index(forKey: username)!)
        users.remove(at: users.index(forKey: username)!)
        userAccountPasswords.removeValue(forKey: username)
        userDevicePasswords.removeValue(forKey: username)
        userCardPasswords.removeValue(forKey: username)
        userInfoPasswords.removeValue(forKey: username)
        
        
        UserDefaults.standard.set(users, forKey: "users")
        UserDefaults.standard.set(names, forKey: "names")
        UserDefaults.standard.set(userAccountPasswords, forKey: "userAccountPasswords")
        UserDefaults.standard.set(userDevicePasswords, forKey: "userDevicePasswords")
        UserDefaults.standard.set(userCardPasswords, forKey: "userCardPasswords")
        UserDefaults.standard.set(userInfoPasswords, forKey: "userInfoPasswords")
        performSegue(withIdentifier: "AccountEditToStart", sender: self)
    }
    
    
    

    
    @IBAction func TapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.resignFirstResponder()
        AuthenticationView.resignFirstResponder()
        resetTimer()
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
    
    
    @IBAction func BackToMain(_ sender: UIButton) {
        home = true
        performSegue(withIdentifier: "AccountEditToMain", sender: self)
    }
    
    @IBAction func SignOut(_ sender: UIButton) {
        
        timer.invalidate()
        view.endEditing(true)
        performSegue(withIdentifier: "AccountEditToStart", sender: self)
    }
    
    func resetTimer()
    {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(SignOut), userInfo: nil, repeats: false)
    }
    
    @IBAction func textboxEditing(_ sender: UITextField) {
        resetTimer()
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
