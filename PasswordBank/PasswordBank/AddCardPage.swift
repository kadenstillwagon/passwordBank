//
//  AddCardPage.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 8/14/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import UIKit

class AddCardPage: UIViewController {
    
    @IBOutlet weak var CardNumber: UITextField!
    @IBOutlet weak var NameOnCard: UITextField!
    @IBOutlet weak var CVV: UITextField!
    @IBOutlet weak var ExpirationDate: UITextField!
    @IBOutlet weak var CardName: UITextField!
    
    @IBOutlet weak var WarningLabel: UILabel!
    
    var userCardPasswords = [String:[String:[String]]]()
    var users = [String:String]()
    var names = [String:String]()
    var ciphers = [String:String]()
    var username = ""
    var password = ""
    
    var cardPasswordAdded = false
    
    var lastCardNumber = ""
    var lastCVV = ""
    var lastExpirationDate = ""
    
    var page = "cards"
    
    var color1 = UIColor()
    var color2 = UIColor()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        
        WarningLabel.isHidden = true
        
        
        CardNumber.attributedPlaceholder = NSAttributedString(string: "Card Number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        NameOnCard.attributedPlaceholder = NSAttributedString(string: "Name on Card", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        CVV.attributedPlaceholder = NSAttributedString(string: "CVV", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        ExpirationDate.attributedPlaceholder = NSAttributedString(string: "Expiration Date", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        CardName.attributedPlaceholder = NSAttributedString(string: "Card Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var mainController = segue.destination as! Main
        mainController.userCardPasswords = self.userCardPasswords
        mainController.cardPasswordAdded = self.cardPasswordAdded
        mainController.users = self.users
        mainController.names = self.names
        mainController.ciphers = self.ciphers
        mainController.username = self.username
        mainController.password = self.password
        mainController.page = self.page
    }

    @IBAction func BackToMain(_ sender: UIButton) {
        performSegue(withIdentifier: "NewCardToMain", sender: self)
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
    
    @IBAction func CardEnterUpdate(_ sender: UITextField) {
        
        if CardNumber.text!.count == 4 && CardNumber.text!.count > lastCardNumber.count || CardNumber.text!.count == 9 && CardNumber.text!.count > lastCardNumber.count || CardNumber.text!.count == 14 && CardNumber.text!.count > lastCardNumber.count
        {
            CardNumber.text = CardNumber.text! + " "
        }
        if CardNumber.text!.count == 20
        {
            CardNumber.text = lastCardNumber
        }
        
       lastCardNumber = CardNumber.text!
        
    }
    
    @IBAction func CVVEnterUpdate(_ sender: UITextField) {
        
        if CVV.text!.count > 3
        {
            CVV.text = lastCVV
        }
        
        lastCVV = CVV.text!
    }
    
    @IBAction func DateEnterUpdate(_ sender: UITextField) {
        
        if ExpirationDate.text!.count == 2 && ExpirationDate.text!.count > lastExpirationDate.count
        {
            ExpirationDate.text = ExpirationDate.text! + "/"
        }
        if ExpirationDate.text!.count == 6
        {
            ExpirationDate.text = lastExpirationDate
        }
        
        lastExpirationDate = ExpirationDate.text!
    }
    
    @IBAction func Submit(_ sender: UIButton) {
        
        var cardNumber = CardNumber.text!
        var name = NameOnCard.text!
        var cvv = CVV.text!
        var expirationDate = ExpirationDate.text!
        var cardName = CardName.text!
        
        
        
        if cardNumber.count == 19 && name.count > 2 && cvv.count == 3 && expirationDate.count == 5 && cardName.count > 0
        {
            var cardInfo = [encrypt(cardNumber, decryption1(ciphers[username]!)), encrypt(name, decryption1(ciphers[username]!)), encrypt(cvv, decryption1(ciphers[username]!)), encrypt(expirationDate, decryption1(ciphers[username]!))]
            userCardPasswords[username]![cardName] = cardInfo
            cardPasswordAdded = true
            WarningLabel.isHidden = true
            performSegue(withIdentifier: "NewCardToMain", sender: self)
        }
        else
        {
            WarningLabel.isHidden = false
        }
    }
    

    
}
