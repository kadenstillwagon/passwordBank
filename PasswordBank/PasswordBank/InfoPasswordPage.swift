//
//  InfoPasswordPage.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 8/14/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import UIKit

class InfoPasswordPage: UIViewController {
    
    var userInfoPasswords = [String:[String:String]]()
    var users = [String:String]()
    var names = [String:String]()
    var ciphers = [String:String]()
    var username = ""
    var password = ""
    var passIdentifier = ""
    
    var infoPassword = ""
    
    
    @IBOutlet weak var ScrollView: UIScrollView!
    
//    @IBOutlet var SwipeUp: UISwipeGestureRecognizer!
//    @IBOutlet var SwipeDown: UISwipeGestureRecognizer!
    
    
    
    @IBOutlet weak var ResetOrDelete: UIStackView!
    @IBOutlet weak var ResetButton: UIButton!
    @IBOutlet weak var DeleteButton: UIButton!
    @IBOutlet weak var ConfirmOrCancelReset: UIStackView!
    @IBOutlet weak var ConfirmReset: UIButton!
    @IBOutlet weak var CancelReset: UIButton!
    
    var infoPasswordChanged = false
    
    var home = false
    
    
    @IBOutlet weak var InfoName: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var color1 = UIColor()
    var color2 = UIColor()

    var timer = Timer()
    
    var previousInfo = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfirmReset.isHidden = true
        CancelReset.isHidden = true
        
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(SignOut), userInfo: nil, repeats: false)
        
        textView.panGestureRecognizer.addTarget(self, action: #selector(scrolling))
 
        
        
        textView.isEditable = false
        InfoName.text = passIdentifier
        textView.text = infoPassword
        fitText()
        

        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        timer.invalidate()
        if home == true
        {
        var mainController = segue.destination as! Main
        mainController.userInfoPasswords = self.userInfoPasswords
        mainController.users = self.users
        mainController.names = self.names
        mainController.ciphers = self.ciphers
        mainController.username = self.username
        mainController.password = self.password
        mainController.infoPasswordChanged = self.infoPasswordChanged
        mainController.page = "info"
        }
    }
    

 
    
    @IBAction func resetInformation(_ sender: UIButton) {
        
        
        previousInfo = userInfoPasswords[username]![passIdentifier]!
        
        resetTimer()
        
        textView.isEditable = true
        ResetOrDelete.isHidden = true
        ResetButton.isHidden = true
        DeleteButton.isHidden = true
        
        ConfirmOrCancelReset.isHidden = false
        ConfirmReset.isHidden = false
        CancelReset.isHidden = false
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor(hue: CGFloat(0), saturation: CGFloat(0), brightness: CGFloat(0), alpha: 1.0).cgColor, UIColor(hue: CGFloat(0), saturation: CGFloat(0), brightness: CGFloat(0.3), alpha: 1.0).cgColor]
        gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        
    }
    
    @IBAction func SubmitReset(_ sender: UIButton) {
        
        
        resetTimer()
        userInfoPasswords[username]![passIdentifier]! = adjustedEncrypt(textView.text!, decryption1(ciphers[username]!))
        textView.text = adjustedDecrypt(userInfoPasswords[username]![passIdentifier]!, decryption1(ciphers[username]!))
        infoPasswordChanged = true
        
        textView.isEditable = false
        ResetOrDelete.isHidden = false
        ResetButton.isHidden = false
        DeleteButton.isHidden = false
        
        ConfirmOrCancelReset.isHidden = true
        ConfirmReset.isHidden = true
        CancelReset.isHidden = true

        let gradient = CAGradientLayer()
        
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    
    @IBAction func CancelReset(_ sender: UIButton) {
        
        resetTimer()
        textView.text = adjustedDecrypt(previousInfo, decryption1(ciphers[username]!))
        
        textView.isEditable = false
        ResetOrDelete.isHidden = false
        ResetButton.isHidden = false
        DeleteButton.isHidden = false
        
        ConfirmOrCancelReset.isHidden = true
        ConfirmReset.isHidden = true
        CancelReset.isHidden = true

        let gradient = CAGradientLayer()
        
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    
    
    
    
    @IBAction func deleteInformation(_ sender: UIButton) {
        
        userInfoPasswords[username]!.removeValue(forKey: passIdentifier)
        infoPasswordChanged = true
        home = true
        performSegue(withIdentifier: "InfoPassToMain", sender: self)
    }
    
    

    
    
 
    func fitText()
    {
        
        //Adjusts size of password name font
        if passIdentifier.count <= 5
        {
            InfoName.font = UIFont.systemFont(ofSize: 48)
        }
        if passIdentifier.count <= 10 && passIdentifier.count > 5
        {
            InfoName.font = UIFont.systemFont(ofSize: 43)
        }
        if passIdentifier.count <= 15 && passIdentifier.count > 10
        {
            InfoName.font = UIFont.systemFont(ofSize: 38)
        }
        if passIdentifier.count <= 20 && passIdentifier.count > 15
        {
            InfoName.font = UIFont.systemFont(ofSize: 33)
        }
        if passIdentifier.count <= 25 && passIdentifier.count > 20
        {
            InfoName.font = UIFont.systemFont(ofSize: 30)
        }
        if passIdentifier.count <= 30 && passIdentifier.count > 25
        {
            InfoName.font = UIFont.systemFont(ofSize: 27)
        }
        if passIdentifier.count <= 35 && passIdentifier.count > 30
        {
            InfoName.font = UIFont.systemFont(ofSize: 24)
        }
        if passIdentifier.count <= 40 && passIdentifier.count > 35
        {
            InfoName.font = UIFont.systemFont(ofSize: 21)
        }
        
    }
    

    
    @objc func scrolling()
    {
        resetTimer()
    }
    
    @IBAction func TapRecognizer(_ sender: UITapGestureRecognizer) {
        resetTimer()
        textView.resignFirstResponder()
        
        
    }
    
    @IBAction func BackToMain(_ sender: UIButton) {
        home = true
        performSegue(withIdentifier: "InfoPassToMain", sender: self)
    }
    
    func resetTimer()
    {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(SignOut), userInfo: nil, repeats: false)
    }
    
    @IBAction func SignOut(_ sender: UIButton) {
        
        timer.invalidate()
        view.endEditing(true)
        performSegue(withIdentifier: "ViewInfoToStart", sender: self)
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
