//
//  CardPasswordPage.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 8/14/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import UIKit

class CardPasswordPage: UIViewController {
    
    @IBOutlet weak var CardName: UILabel!
    @IBOutlet weak var CardNumber: UITextView!
    @IBOutlet weak var NameOnCard: UITextView!
    @IBOutlet weak var CVV: UITextView!
    @IBOutlet weak var ExpirationDate: UITextView!
    
    var userCardPasswords = [String:[String:[String]]]()
    var users = [String:String]()
    var names = [String:String]()
    var ciphers = [String:String]()
    var username = ""
    var password = ""
    var passIdentifier = ""
    
    
    var cardPasswordChanged = false
    
    var home = false
    
    var color1 = UIColor()
    var color2 = UIColor()
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(SignOut), userInfo: nil, repeats: false)
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        
        
        CardName.text = passIdentifier
        fitText()
        
        CardNumber.text = decrypt(userCardPasswords[username]![passIdentifier]![0], decryption1(ciphers[username]!))
        NameOnCard.text = decrypt(userCardPasswords[username]![passIdentifier]![1], decryption1(ciphers[username]!))
        CVV.text = decrypt(userCardPasswords[username]![passIdentifier]![2], decryption1(ciphers[username]!))
        ExpirationDate.text = decrypt(userCardPasswords[username]![passIdentifier]![3], decryption1(ciphers[username]!))

        CardName.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        timer.invalidate()
        if home == true
        {
        var mainController = segue.destination as! Main
        mainController.userCardPasswords = self.userCardPasswords
        mainController.users = self.users
        mainController.names = self.names
        mainController.ciphers = self.ciphers
        mainController.username = self.username
        mainController.password = self.password
        mainController.cardPasswordChanged = self.cardPasswordChanged
        mainController.page = "cards"
        }
    }
    
    func fitText()
    {
        if passIdentifier.count <= 5
        {
            CardName.font = UIFont.systemFont(ofSize: 48)
        }
        if passIdentifier.count <= 10 && passIdentifier.count > 5
        {
            CardName.font = UIFont.systemFont(ofSize: 43)
        }
        if passIdentifier.count <= 15 && passIdentifier.count > 10
        {
            CardName.font = UIFont.systemFont(ofSize: 38)
        }
        if passIdentifier.count <= 20 && passIdentifier.count > 15
        {
            CardName.font = UIFont.systemFont(ofSize: 33)
        }
        if passIdentifier.count <= 25 && passIdentifier.count > 20
        {
            CardName.font = UIFont.systemFont(ofSize: 30)
        }
        if passIdentifier.count <= 30 && passIdentifier.count > 25
        {
            CardName.font = UIFont.systemFont(ofSize: 27)
        }
        if passIdentifier.count <= 35 && passIdentifier.count > 30
        {
            CardName.font = UIFont.systemFont(ofSize: 24)
        }
        if passIdentifier.count <= 40 && passIdentifier.count > 35
        {
            CardName.font = UIFont.systemFont(ofSize: 21)
        }
    }
    
    @IBAction func DeletePassword(_ sender: UIButton) {
        
    userCardPasswords[username]!.removeValue(forKey: passIdentifier)
    cardPasswordChanged = true
    home = true
    performSegue(withIdentifier: "CardPassToMain", sender: self)
    }
    
    
    @IBAction func TapRecognizer(_ sender: UITapGestureRecognizer) {
        resetTimer()
    }
    

    
    @IBAction func BackToMain(_ sender: UIButton) {
        home = true
        performSegue(withIdentifier: "CardPassToMain", sender: self)
    }
    
    func resetTimer()
    {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(SignOut), userInfo: nil, repeats: false)
    }
    
    @IBAction func SignOut(_ sender: UIButton) {
        
        timer.invalidate()
        view.endEditing(true)
        performSegue(withIdentifier: "ViewCardToStart", sender: self)
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
