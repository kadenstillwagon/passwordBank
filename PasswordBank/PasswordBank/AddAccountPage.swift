//
//  AddAccountPage.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 8/14/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import UIKit

class AddAccountPage:UIViewController {
    
    @IBOutlet weak var NewPasswordName:UITextField!
    @IBOutlet weak var NewPassword:UITextField!
    
    
    @IBOutlet weak var WarningLabel: UILabel!
    
    
    var userAccountPasswords = [String:[String:String]]()
    var users = [String:String]()
    var names = [String:String]()
    var ciphers = [String:String]()
    var username = ""
    var password = ""
    
    
    var accountPasswordAdded = false
    
    var page = "accounts"
    
    
    var color1 = UIColor()
    var color2 = UIColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WarningLabel.isHidden = true
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        
        
        NewPasswordName.attributedPlaceholder = NSAttributedString(string: "Password Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        NewPassword.attributedPlaceholder = NSAttributedString(string: "New Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var mainController = segue.destination as! Main
        mainController.userAccountPasswords = self.userAccountPasswords
        mainController.accountPasswordAdded = self.accountPasswordAdded
        mainController.users = self.users
        mainController.names = self.names
        mainController.ciphers = self.ciphers
        mainController.username = self.username
        mainController.password = self.password
        mainController.page = self.page
    }
    
    @IBAction func CreateNewPassword(_ sender: UIButton) {
        
        var passName = String(NewPasswordName.text!)
        var newPass = String(NewPassword.text!)
        if passName.count > 0 && newPass.count > 0
        {
            userAccountPasswords[username]![passName] = encrypt(newPass, decryption1(ciphers[username]!))
            accountPasswordAdded = true
            WarningLabel.isHidden = true
            performSegue(withIdentifier: "NewAccountToMain", sender: self)
        }
        else
        {
            WarningLabel.isHidden = false
        }
    }
    
    
    
    @IBAction func BackToMain(_ sender: UIButton) {
        performSegue(withIdentifier: "NewAccountToMain", sender: self)
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
    
    
    
    
    
    
    @IBAction func GenerateStrongPass(_ sender: UIButton) {
        
        var newRandomPass = generateRandomPass()
        NewPassword.text = newRandomPass
    }
    
    
    
    
    
    func generateRandomPass() -> String
    {
      var one = String(Int.random(in: 0...61))
    if Int(one)! < 10
    {
        
    }
    else if Int(one) == 10
    {
        one = "a"
    }
    else if Int(one) == 11
    {
        one = "b"
    }
    else if Int(one) == 12
    {
        one = "c"
    }
    else if Int(one) == 13
    {
        one = "d"
    }
    else if Int(one) == 14
    {
        one = "e"
    }
    else if Int(one) == 15
    {
        one = "f"
    }
    else if Int(one) == 16
    {
        one = "g"
    }
    else if Int(one) == 17
    {
        one = "h"
    }
    else if Int(one) == 18
    {
        one = "i"
    }
    else if Int(one) == 19
    {
        one = "j"
    }
    else if Int(one) == 20
    {
        one = "k"
    }
    else if Int(one) == 21
    {
        one = "l"
    }
    else if Int(one) == 22
    {
        one = "m"
    }
    else if Int(one) == 23
    {
        one = "n"
    }
    else if Int(one) == 24
    {
        one = "o"
    }
    else if Int(one) == 25
    {
        one = "p"
    }
    else if Int(one) == 26
    {
        one = "q"
    }
    else if Int(one) == 27
    {
        one = "r"
    }
    else if Int(one) == 28
    {
        one = "s"
    }
    else if Int(one) == 29
    {
        one = "t"
    }
    else if Int(one) == 30
    {
        one = "u"
    }
    else if Int(one) == 31
    {
        one = "v"
    }
    else if Int(one) == 32
    {
        one = "w"
    }
    else if Int(one) == 33
    {
        one = "x"
    }
    else if Int(one) == 34
    {
        one = "y"
    }
    else if Int(one) == 35
    {
        one = "z"
    }
    else if Int(one) == 36
    {
        one = "A"
    }
    else if Int(one) == 37
    {
        one = "B"
    }
    else if Int(one) == 38
    {
        one = "C"
    }
    else if Int(one) == 39
    {
        one = "D"
    }
    else if Int(one) == 40
    {
        one = "E"
    }
    else if Int(one) == 41
    {
        one = "F"
    }
    else if Int(one) == 42
    {
        one = "G"
    }
    else if Int(one) == 43
    {
        one = "H"
    }
    else if Int(one) == 44
    {
        one = "I"
    }
    else if Int(one) == 45
    {
        one = "J"
    }
    else if Int(one) == 46
    {
        one = "K"
    }
    else if Int(one) == 47
    {
        one = "L"
    }
    else if Int(one) == 48
    {
        one = "M"
    }
    else if Int(one) == 49
    {
        one = "N"
    }
    else if Int(one) == 50
    {
        one = "O"
    }
    else if Int(one) == 51
    {
        one = "P"
    }
    else if Int(one) == 52
    {
        one = "Q"
    }
    else if Int(one) == 53
    {
        one = "R"
    }
    else if Int(one) == 54
    {
        one = "S"
    }
    else if Int(one) == 55
    {
        one = "T"
    }
    else if Int(one) == 56
    {
        one = "U"
    }
    else if Int(one) == 57
    {
        one = "V"
    }
    else if Int(one) == 58
    {
        one = "W"
    }
    else if Int(one) == 59
    {
        one = "X"
    }
    else if Int(one) == 60
    {
        one = "Y"
    }
    else if Int(one) == 61
    {
        one = "Z"
    }

    var two = String(Int.random(in: 0...61))
    if Int(two)! < 10
    {
        
    }
    else if Int(two) == 10
    {
        two = "a"
    }
    else if Int(two) == 11
    {
        two = "b"
    }
    else if Int(two) == 12
    {
        two = "c"
    }
    else if Int(two) == 13
    {
        two = "d"
    }
    else if Int(two) == 14
    {
        two = "e"
    }
    else if Int(two) == 15
    {
        two = "f"
    }
    else if Int(two) == 16
    {
        two = "g"
    }
    else if Int(two) == 17
    {
        two = "h"
    }
    else if Int(two) == 18
    {
        two = "i"
    }
    else if Int(two) == 19
    {
        two = "j"
    }
    else if Int(two) == 20
    {
        two = "k"
    }
    else if Int(two) == 21
    {
        two = "l"
    }
    else if Int(two) == 22
    {
        two = "m"
    }
    else if Int(two) == 23
    {
        two = "n"
    }
    else if Int(two) == 24
    {
        two = "o"
    }
    else if Int(two) == 25
    {
        two = "p"
    }
    else if Int(two) == 26
    {
        two = "q"
    }
    else if Int(two) == 27
    {
        two = "r"
    }
    else if Int(two) == 28
    {
        two = "s"
    }
    else if Int(two) == 29
    {
        two = "t"
    }
    else if Int(two) == 30
    {
        two = "u"
    }
    else if Int(two) == 31
    {
        two = "v"
    }
    else if Int(two) == 32
    {
        two = "w"
    }
    else if Int(two) == 33
    {
        two = "x"
    }
    else if Int(two) == 34
    {
        two = "y"
    }
    else if Int(two) == 35
    {
        two = "z"
    }
    else if Int(two) == 36
    {
        two = "A"
    }
    else if Int(two) == 37
    {
        two = "B"
    }
    else if Int(two) == 38
    {
        two = "C"
    }
    else if Int(two) == 39
    {
        two = "D"
    }
    else if Int(two) == 40
    {
        two = "E"
    }
    else if Int(two) == 41
    {
        two = "F"
    }
    else if Int(two) == 42
    {
        two = "G"
    }
    else if Int(two) == 43
    {
        two = "H"
    }
    else if Int(two) == 44
    {
        two = "I"
    }
    else if Int(two) == 45
    {
        two = "J"
    }
    else if Int(two) == 46
    {
        two = "K"
    }
    else if Int(two) == 47
    {
        two = "L"
    }
    else if Int(two) == 48
    {
        two = "M"
    }
    else if Int(two) == 49
    {
        two = "N"
    }
    else if Int(two) == 50
    {
        two = "O"
    }
    else if Int(two) == 51
    {
        two = "P"
    }
    else if Int(two) == 52
    {
        two = "Q"
    }
    else if Int(two) == 53
    {
        two = "R"
    }
    else if Int(two) == 54
    {
        two = "S"
    }
    else if Int(two) == 55
    {
        two = "T"
    }
    else if Int(two) == 56
    {
        two = "U"
    }
    else if Int(two) == 57
    {
        two = "V"
    }
    else if Int(two) == 58
    {
        two = "W"
    }
    else if Int(two) == 59
    {
        two = "X"
    }
    else if Int(two) == 60
    {
        two = "Y"
    }
    else if Int(two) == 61
    {
        two = "Z"
    }

    var three = String(Int.random(in: 0...61))
    if Int(three)! < 10
    {
        
    }
    else if Int(three) == 10
    {
        three = "a"
    }
    else if Int(three) == 11
    {
        three = "b"
    }
    else if Int(three) == 12
    {
        three = "c"
    }
    else if Int(three) == 13
    {
        three = "d"
    }
    else if Int(three) == 14
    {
        three = "e"
    }
    else if Int(three) == 15
    {
        three = "f"
    }
    else if Int(three) == 16
    {
        three = "g"
    }
    else if Int(three) == 17
    {
        three = "h"
    }
    else if Int(three) == 18
    {
        three = "i"
    }
    else if Int(three) == 19
    {
        three = "j"
    }
    else if Int(three) == 20
    {
        three = "k"
    }
    else if Int(three) == 21
    {
        three = "l"
    }
    else if Int(three) == 22
    {
        three = "m"
    }
    else if Int(three) == 23
    {
        three = "n"
    }
    else if Int(three) == 24
    {
        three = "o"
    }
    else if Int(three) == 25
    {
        three = "p"
    }
    else if Int(three) == 26
    {
        three = "q"
    }
    else if Int(three) == 27
    {
        three = "r"
    }
    else if Int(three) == 28
    {
        three = "s"
    }
    else if Int(three) == 29
    {
        three = "t"
    }
    else if Int(three) == 30
    {
        three = "u"
    }
    else if Int(three) == 31
    {
        three = "v"
    }
    else if Int(three) == 32
    {
        three = "w"
    }
    else if Int(three) == 33
    {
        three = "x"
    }
    else if Int(three) == 34
    {
        three = "y"
    }
    else if Int(three) == 35
    {
        three = "z"
    }
    else if Int(three) == 36
    {
        three = "A"
    }
    else if Int(three) == 37
    {
        three = "B"
    }
    else if Int(three) == 38
    {
        three = "C"
    }
    else if Int(three) == 39
    {
        three = "D"
    }
    else if Int(three) == 40
    {
        three = "E"
    }
    else if Int(three) == 41
    {
        three = "F"
    }
    else if Int(three) == 42
    {
        three = "G"
    }
    else if Int(three) == 43
    {
        three = "H"
    }
    else if Int(three) == 44
    {
        three = "I"
    }
    else if Int(three) == 45
    {
        three = "J"
    }
    else if Int(three) == 46
    {
        three = "K"
    }
    else if Int(three) == 47
    {
        three = "L"
    }
    else if Int(three) == 48
    {
        three = "M"
    }
    else if Int(three) == 49
    {
        three = "N"
    }
    else if Int(three) == 50
    {
        three = "O"
    }
    else if Int(three) == 51
    {
        three = "P"
    }
    else if Int(three) == 52
    {
        three = "Q"
    }
    else if Int(three) == 53
    {
        three = "R"
    }
    else if Int(three) == 54
    {
        three = "S"
    }
    else if Int(three) == 55
    {
        three = "T"
    }
    else if Int(three) == 56
    {
        three = "U"
    }
    else if Int(three) == 57
    {
        three = "V"
    }
    else if Int(three) == 58
    {
        three = "W"
    }
    else if Int(three) == 59
    {
        three = "X"
    }
    else if Int(three) == 60
    {
        three = "Y"
    }
    else if Int(three) == 61
    {
        three = "Z"
    }

    var four = String(Int.random(in: 0...61))
    if Int(four)! < 10
    {
        
    }
    else if Int(four) == 10
    {
        four = "a"
    }
    else if Int(four) == 11
    {
        four = "b"
    }
    else if Int(four) == 12
    {
        four = "c"
    }
    else if Int(four) == 13
    {
        four = "d"
    }
    else if Int(four) == 14
    {
        four = "e"
    }
    else if Int(four) == 15
    {
        four = "f"
    }
    else if Int(four) == 16
    {
        four = "g"
    }
    else if Int(four) == 17
    {
        four = "h"
    }
    else if Int(four) == 18
    {
        four = "i"
    }
    else if Int(four) == 19
    {
        four = "j"
    }
    else if Int(four) == 20
    {
        four = "k"
    }
    else if Int(four) == 21
    {
        four = "l"
    }
    else if Int(four) == 22
    {
        four = "m"
    }
    else if Int(four) == 23
    {
        four = "n"
    }
    else if Int(four) == 24
    {
        four = "o"
    }
    else if Int(four) == 25
    {
        four = "p"
    }
    else if Int(four) == 26
    {
        four = "q"
    }
    else if Int(four) == 27
    {
        four = "r"
    }
    else if Int(four) == 28
    {
        four = "s"
    }
    else if Int(four) == 29
    {
        four = "t"
    }
    else if Int(four) == 30
    {
        four = "u"
    }
    else if Int(four) == 31
    {
        four = "v"
    }
    else if Int(four) == 32
    {
        four = "w"
    }
    else if Int(four) == 33
    {
        four = "x"
    }
    else if Int(four) == 34
    {
        four = "y"
    }
    else if Int(four) == 35
    {
        four = "z"
    }
    else if Int(four) == 36
    {
        four = "A"
    }
    else if Int(four) == 37
    {
        four = "B"
    }
    else if Int(four) == 38
    {
        four = "C"
    }
    else if Int(four) == 39
    {
        four = "D"
    }
    else if Int(four) == 40
    {
        four = "E"
    }
    else if Int(four) == 41
    {
        four = "F"
    }
    else if Int(four) == 42
    {
        four = "G"
    }
    else if Int(four) == 43
    {
        four = "H"
    }
    else if Int(four) == 44
    {
        four = "I"
    }
    else if Int(four) == 45
    {
        four = "J"
    }
    else if Int(four) == 46
    {
        four = "K"
    }
    else if Int(four) == 47
    {
        four = "L"
    }
    else if Int(four) == 48
    {
        four = "M"
    }
    else if Int(four) == 49
    {
        four = "N"
    }
    else if Int(four) == 50
    {
        four = "O"
    }
    else if Int(four) == 51
    {
        four = "P"
    }
    else if Int(four) == 52
    {
        four = "Q"
    }
    else if Int(four) == 53
    {
        four = "R"
    }
    else if Int(four) == 54
    {
        four = "S"
    }
    else if Int(four) == 55
    {
        four = "T"
    }
    else if Int(four) == 56
    {
        four = "U"
    }
    else if Int(four) == 57
    {
        four = "V"
    }
    else if Int(four) == 58
    {
        four = "W"
    }
    else if Int(four) == 59
    {
        four = "X"
    }
    else if Int(four) == 60
    {
        four = "Y"
    }
    else if Int(four) == 61
    {
        four = "Z"
    }

    var five = String(Int.random(in: 0...61))
    if Int(five)! < 10
    {
        
    }
    else if Int(five) == 10
    {
        five = "a"
    }
    else if Int(five) == 11
    {
        five = "b"
    }
    else if Int(five) == 12
    {
        five = "c"
    }
    else if Int(five) == 13
    {
        five = "d"
    }
    else if Int(five) == 14
    {
        five = "e"
    }
    else if Int(five) == 15
    {
        five = "f"
    }
    else if Int(five) == 16
    {
        five = "g"
    }
    else if Int(five) == 17
    {
        five = "h"
    }
    else if Int(five) == 18
    {
        five = "i"
    }
    else if Int(five) == 19
    {
        five = "j"
    }
    else if Int(five) == 20
    {
        five = "k"
    }
    else if Int(five) == 21
    {
        five = "l"
    }
    else if Int(five) == 22
    {
        five = "m"
    }
    else if Int(five) == 23
    {
        five = "n"
    }
    else if Int(five) == 24
    {
        five = "o"
    }
    else if Int(five) == 25
    {
        five = "p"
    }
    else if Int(five) == 26
    {
        five = "q"
    }
    else if Int(five) == 27
    {
        five = "r"
    }
    else if Int(five) == 28
    {
        five = "s"
    }
    else if Int(five) == 29
    {
        five = "t"
    }
    else if Int(five) == 30
    {
        five = "u"
    }
    else if Int(five) == 31
    {
        five = "v"
    }
    else if Int(five) == 32
    {
        five = "w"
    }
    else if Int(five) == 33
    {
        five = "x"
    }
    else if Int(five) == 34
    {
        five = "y"
    }
    else if Int(five) == 35
    {
        five = "z"
    }
    else if Int(five) == 36
    {
        five = "A"
    }
    else if Int(five) == 37
    {
        five = "B"
    }
    else if Int(five) == 38
    {
        five = "C"
    }
    else if Int(five) == 39
    {
        five = "D"
    }
    else if Int(five) == 40
    {
        five = "E"
    }
    else if Int(five) == 41
    {
        five = "F"
    }
    else if Int(five) == 42
    {
        five = "G"
    }
    else if Int(five) == 43
    {
        five = "H"
    }
    else if Int(five) == 44
    {
        five = "I"
    }
    else if Int(five) == 45
    {
        five = "J"
    }
    else if Int(five) == 46
    {
        five = "K"
    }
    else if Int(five) == 47
    {
        five = "L"
    }
    else if Int(five) == 48
    {
        five = "M"
    }
    else if Int(five) == 49
    {
        five = "N"
    }
    else if Int(five) == 50
    {
        five = "O"
    }
    else if Int(five) == 51
    {
        five = "P"
    }
    else if Int(five) == 52
    {
        five = "Q"
    }
    else if Int(five) == 53
    {
        five = "R"
    }
    else if Int(five) == 54
    {
        five = "S"
    }
    else if Int(five) == 55
    {
        five = "T"
    }
    else if Int(five) == 56
    {
        five = "U"
    }
    else if Int(five) == 57
    {
        five = "V"
    }
    else if Int(five) == 58
    {
        five = "W"
    }
    else if Int(five) == 59
    {
        five = "X"
    }
    else if Int(five) == 60
    {
        five = "Y"
    }
    else if Int(five) == 61
    {
        five = "Z"
    }

    var six = String(Int.random(in: 0...61))
    if Int(six)! < 10
    {
        
    }
    else if Int(six) == 10
    {
        six = "a"
    }
    else if Int(six) == 11
    {
        six = "b"
    }
    else if Int(six) == 12
    {
        six = "c"
    }
    else if Int(six) == 13
    {
        six = "d"
    }
    else if Int(six) == 14
    {
        six = "e"
    }
    else if Int(six) == 15
    {
        six = "f"
    }
    else if Int(six) == 16
    {
        six = "g"
    }
    else if Int(six) == 17
    {
        six = "h"
    }
    else if Int(six) == 18
    {
        six = "i"
    }
    else if Int(six) == 19
    {
        six = "j"
    }
    else if Int(six) == 20
    {
        six = "k"
    }
    else if Int(six) == 21
    {
        six = "l"
    }
    else if Int(six) == 22
    {
        six = "m"
    }
    else if Int(six) == 23
    {
        six = "n"
    }
    else if Int(six) == 24
    {
        six = "o"
    }
    else if Int(six) == 25
    {
        six = "p"
    }
    else if Int(six) == 26
    {
        six = "q"
    }
    else if Int(six) == 27
    {
        six = "r"
    }
    else if Int(six) == 28
    {
        six = "s"
    }
    else if Int(six) == 29
    {
        six = "t"
    }
    else if Int(six) == 30
    {
        six = "u"
    }
    else if Int(six) == 31
    {
        six = "v"
    }
    else if Int(six) == 32
    {
        six = "w"
    }
    else if Int(six) == 33
    {
        six = "x"
    }
    else if Int(six) == 34
    {
        six = "y"
    }
    else if Int(six) == 35
    {
        six = "z"
    }
    else if Int(six) == 36
    {
        six = "A"
    }
    else if Int(six) == 37
    {
        six = "B"
    }
    else if Int(six) == 38
    {
        six = "C"
    }
    else if Int(six) == 39
    {
        six = "D"
    }
    else if Int(six) == 40
    {
        six = "E"
    }
    else if Int(six) == 41
    {
        six = "F"
    }
    else if Int(six) == 42
    {
        six = "G"
    }
    else if Int(six) == 43
    {
        six = "H"
    }
    else if Int(six) == 44
    {
        six = "I"
    }
    else if Int(six) == 45
    {
        six = "J"
    }
    else if Int(six) == 46
    {
        six = "K"
    }
    else if Int(six) == 47
    {
        six = "L"
    }
    else if Int(six) == 48
    {
        six = "M"
    }
    else if Int(six) == 49
    {
        six = "N"
    }
    else if Int(six) == 50
    {
        six = "O"
    }
    else if Int(six) == 51
    {
        six = "P"
    }
    else if Int(six) == 52
    {
        six = "Q"
    }
    else if Int(six) == 53
    {
        six = "R"
    }
    else if Int(six) == 54
    {
        six = "S"
    }
    else if Int(six) == 55
    {
        six = "T"
    }
    else if Int(six) == 56
    {
        six = "U"
    }
    else if Int(six) == 57
    {
        six = "V"
    }
    else if Int(six) == 58
    {
        six = "W"
    }
    else if Int(six) == 59
    {
        six = "X"
    }
    else if Int(six) == 60
    {
        six = "Y"
    }
    else if Int(six) == 61
    {
        six = "Z"
    }

    var seven = String(Int.random(in: 0...61))
    if Int(seven)! < 10
    {
        
    }
    else if Int(seven) == 10
    {
        seven = "a"
    }
    else if Int(seven) == 11
    {
        seven = "b"
    }
    else if Int(seven) == 12
    {
        seven = "c"
    }
    else if Int(seven) == 13
    {
        seven = "d"
    }
    else if Int(seven) == 14
    {
        seven = "e"
    }
    else if Int(seven) == 15
    {
        seven = "f"
    }
    else if Int(seven) == 16
    {
        seven = "g"
    }
    else if Int(seven) == 17
    {
        seven = "h"
    }
    else if Int(seven) == 18
    {
        seven = "i"
    }
    else if Int(seven) == 19
    {
        seven = "j"
    }
    else if Int(seven) == 20
    {
        seven = "k"
    }
    else if Int(seven) == 21
    {
        seven = "l"
    }
    else if Int(seven) == 22
    {
        seven = "m"
    }
    else if Int(seven) == 23
    {
        seven = "n"
    }
    else if Int(seven) == 24
    {
        seven = "o"
    }
    else if Int(seven) == 25
    {
        seven = "p"
    }
    else if Int(seven) == 26
    {
        seven = "q"
    }
    else if Int(seven) == 27
    {
        seven = "r"
    }
    else if Int(seven) == 28
    {
        seven = "s"
    }
    else if Int(seven) == 29
    {
        seven = "t"
    }
    else if Int(seven) == 30
    {
        seven = "u"
    }
    else if Int(seven) == 31
    {
        seven = "v"
    }
    else if Int(seven) == 32
    {
        seven = "w"
    }
    else if Int(seven) == 33
    {
        seven = "x"
    }
    else if Int(seven) == 34
    {
        seven = "y"
    }
    else if Int(seven) == 35
    {
        seven = "z"
    }
    else if Int(seven) == 36
    {
        seven = "A"
    }
    else if Int(seven) == 37
    {
        seven = "B"
    }
    else if Int(seven) == 38
    {
        seven = "C"
    }
    else if Int(seven) == 39
    {
        seven = "D"
    }
    else if Int(seven) == 40
    {
        seven = "E"
    }
    else if Int(seven) == 41
    {
        seven = "F"
    }
    else if Int(seven) == 42
    {
        seven = "G"
    }
    else if Int(seven) == 43
    {
        seven = "H"
    }
    else if Int(seven) == 44
    {
        seven = "I"
    }
    else if Int(seven) == 45
    {
        seven = "J"
    }
    else if Int(seven) == 46
    {
        seven = "K"
    }
    else if Int(seven) == 47
    {
        seven = "L"
    }
    else if Int(seven) == 48
    {
        seven = "M"
    }
    else if Int(seven) == 49
    {
        seven = "N"
    }
    else if Int(seven) == 50
    {
        seven = "O"
    }
    else if Int(seven) == 51
    {
        seven = "P"
    }
    else if Int(seven) == 52
    {
        seven = "Q"
    }
    else if Int(seven) == 53
    {
        seven = "R"
    }
    else if Int(seven) == 54
    {
        seven = "S"
    }
    else if Int(seven) == 55
    {
        seven = "T"
    }
    else if Int(seven) == 56
    {
        seven = "U"
    }
    else if Int(seven) == 57
    {
        seven = "V"
    }
    else if Int(seven) == 58
    {
        seven = "W"
    }
    else if Int(seven) == 59
    {
        seven = "X"
    }
    else if Int(seven) == 60
    {
        seven = "Y"
    }
    else if Int(seven) == 61
    {
        seven = "Z"
    }

    var eight = String(Int.random(in: 0...61))
    if Int(eight)! < 10
    {
        
    }
    else if Int(eight) == 10
    {
        eight = "a"
    }
    else if Int(eight) == 11
    {
        eight = "b"
    }
    else if Int(eight) == 12
    {
        eight = "c"
    }
    else if Int(eight) == 13
    {
        eight = "d"
    }
    else if Int(eight) == 14
    {
        eight = "e"
    }
    else if Int(eight) == 15
    {
        eight = "f"
    }
    else if Int(eight) == 16
    {
        eight = "g"
    }
    else if Int(eight) == 17
    {
        eight = "h"
    }
    else if Int(eight) == 18
    {
        eight = "i"
    }
    else if Int(eight) == 19
    {
        eight = "j"
    }
    else if Int(eight) == 20
    {
        eight = "k"
    }
    else if Int(eight) == 21
    {
        eight = "l"
    }
    else if Int(eight) == 22
    {
        eight = "m"
    }
    else if Int(eight) == 23
    {
        eight = "n"
    }
    else if Int(eight) == 24
    {
        eight = "o"
    }
    else if Int(eight) == 25
    {
        eight = "p"
    }
    else if Int(eight) == 26
    {
        eight = "q"
    }
    else if Int(eight) == 27
    {
        eight = "r"
    }
    else if Int(eight) == 28
    {
        eight = "s"
    }
    else if Int(eight) == 29
    {
        eight = "t"
    }
    else if Int(eight) == 30
    {
        eight = "u"
    }
    else if Int(eight) == 31
    {
        eight = "v"
    }
    else if Int(eight) == 32
    {
        eight = "w"
    }
    else if Int(eight) == 33
    {
        eight = "x"
    }
    else if Int(eight) == 34
    {
        eight = "y"
    }
    else if Int(eight) == 35
    {
        eight = "z"
    }
    else if Int(eight) == 36
    {
        eight = "A"
    }
    else if Int(eight) == 37
    {
        eight = "B"
    }
    else if Int(eight) == 38
    {
        eight = "C"
    }
    else if Int(eight) == 39
    {
        eight = "D"
    }
    else if Int(eight) == 40
    {
        eight = "E"
    }
    else if Int(eight) == 41
    {
        eight = "F"
    }
    else if Int(eight) == 42
    {
        eight = "G"
    }
    else if Int(eight) == 43
    {
        eight = "H"
    }
    else if Int(eight) == 44
    {
        eight = "I"
    }
    else if Int(eight) == 45
    {
        eight = "J"
    }
    else if Int(eight) == 46
    {
        eight = "K"
    }
    else if Int(eight) == 47
    {
        eight = "L"
    }
    else if Int(eight) == 48
    {
        eight = "M"
    }
    else if Int(eight) == 49
    {
        eight = "N"
    }
    else if Int(eight) == 50
    {
        eight = "O"
    }
    else if Int(eight) == 51
    {
        eight = "P"
    }
    else if Int(eight) == 52
    {
        eight = "Q"
    }
    else if Int(eight) == 53
    {
        eight = "R"
    }
    else if Int(eight) == 54
    {
        eight = "S"
    }
    else if Int(eight) == 55
    {
        eight = "T"
    }
    else if Int(eight) == 56
    {
        eight = "U"
    }
    else if Int(eight) == 57
    {
        eight = "V"
    }
    else if Int(eight) == 58
    {
        eight = "W"
    }
    else if Int(eight) == 59
    {
        eight = "X"
    }
    else if Int(eight) == 60
    {
        eight = "Y"
    }
    else if Int(eight) == 61
    {
        eight = "Z"
    }

    var nine = String(Int.random(in: 0...61))
    if Int(nine)! < 10
    {
        
    }
    else if Int(nine) == 10
    {
        nine = "a"
    }
    else if Int(nine) == 11
    {
        nine = "b"
    }
    else if Int(nine) == 12
    {
        nine = "c"
    }
    else if Int(nine) == 13
    {
        nine = "d"
    }
    else if Int(nine) == 14
    {
        nine = "e"
    }
    else if Int(nine) == 15
    {
        nine = "f"
    }
    else if Int(nine) == 16
    {
        nine = "g"
    }
    else if Int(nine) == 17
    {
        nine = "h"
    }
    else if Int(nine) == 18
    {
        nine = "i"
    }
    else if Int(nine) == 19
    {
        nine = "j"
    }
    else if Int(nine) == 20
    {
        nine = "k"
    }
    else if Int(nine) == 21
    {
        nine = "l"
    }
    else if Int(nine) == 22
    {
        nine = "m"
    }
    else if Int(nine) == 23
    {
        nine = "n"
    }
    else if Int(nine) == 24
    {
        nine = "o"
    }
    else if Int(nine) == 25
    {
        nine = "p"
    }
    else if Int(nine) == 26
    {
        nine = "q"
    }
    else if Int(nine) == 27
    {
        nine = "r"
    }
    else if Int(nine) == 28
    {
        nine = "s"
    }
    else if Int(nine) == 29
    {
        nine = "t"
    }
    else if Int(nine) == 30
    {
        nine = "u"
    }
    else if Int(nine) == 31
    {
        nine = "v"
    }
    else if Int(nine) == 32
    {
        nine = "w"
    }
    else if Int(nine) == 33
    {
        nine = "x"
    }
    else if Int(nine) == 34
    {
        nine = "y"
    }
    else if Int(nine) == 35
    {
        nine = "z"
    }
    else if Int(nine) == 36
    {
        nine = "A"
    }
    else if Int(nine) == 37
    {
        nine = "B"
    }
    else if Int(nine) == 38
    {
        nine = "C"
    }
    else if Int(nine) == 39
    {
        nine = "D"
    }
    else if Int(nine) == 40
    {
        nine = "E"
    }
    else if Int(nine) == 41
    {
        nine = "F"
    }
    else if Int(nine) == 42
    {
        nine = "G"
    }
    else if Int(nine) == 43
    {
        nine = "H"
    }
    else if Int(nine) == 44
    {
        nine = "I"
    }
    else if Int(nine) == 45
    {
        nine = "J"
    }
    else if Int(nine) == 46
    {
        nine = "K"
    }
    else if Int(nine) == 47
    {
        nine = "L"
    }
    else if Int(nine) == 48
    {
        nine = "M"
    }
    else if Int(nine) == 49
    {
        nine = "N"
    }
    else if Int(nine) == 50
    {
        nine = "O"
    }
    else if Int(nine) == 51
    {
        nine = "P"
    }
    else if Int(nine) == 52
    {
        nine = "Q"
    }
    else if Int(nine) == 53
    {
        nine = "R"
    }
    else if Int(nine) == 54
    {
        nine = "S"
    }
    else if Int(nine) == 55
    {
        nine = "T"
    }
    else if Int(nine) == 56
    {
        nine = "U"
    }
    else if Int(nine) == 57
    {
        nine = "V"
    }
    else if Int(nine) == 58
    {
        nine = "W"
    }
    else if Int(nine) == 59
    {
        nine = "X"
    }
    else if Int(nine) == 60
    {
        nine = "Y"
    }
    else if Int(nine) == 61
    {
        nine = "Z"
    }

    var ten = String(Int.random(in: 0...61))
    if Int(ten)! < 10
    {
        
    }
    else if Int(ten) == 10
    {
        ten = "a"
    }
    else if Int(ten) == 11
    {
        ten = "b"
    }
    else if Int(ten) == 12
    {
        ten = "c"
    }
    else if Int(ten) == 13
    {
        ten = "d"
    }
    else if Int(ten) == 14
    {
        ten = "e"
    }
    else if Int(ten) == 15
    {
        ten = "f"
    }
    else if Int(ten) == 16
    {
        ten = "g"
    }
    else if Int(ten) == 17
    {
        ten = "h"
    }
    else if Int(ten) == 18
    {
        ten = "i"
    }
    else if Int(ten) == 19
    {
        ten = "j"
    }
    else if Int(ten) == 20
    {
        ten = "k"
    }
    else if Int(ten) == 21
    {
        ten = "l"
    }
    else if Int(ten) == 22
    {
        ten = "m"
    }
    else if Int(ten) == 23
    {
        ten = "n"
    }
    else if Int(ten) == 24
    {
        ten = "o"
    }
    else if Int(ten) == 25
    {
        ten = "p"
    }
    else if Int(ten) == 26
    {
        ten = "q"
    }
    else if Int(ten) == 27
    {
        ten = "r"
    }
    else if Int(ten) == 28
    {
        ten = "s"
    }
    else if Int(ten) == 29
    {
        ten = "t"
    }
    else if Int(ten) == 30
    {
        ten = "u"
    }
    else if Int(ten) == 31
    {
        ten = "v"
    }
    else if Int(ten) == 32
    {
        ten = "w"
    }
    else if Int(ten) == 33
    {
        ten = "x"
    }
    else if Int(ten) == 34
    {
        ten = "y"
    }
    else if Int(ten) == 35
    {
        ten = "z"
    }
    else if Int(ten) == 36
    {
        ten = "A"
    }
    else if Int(ten) == 37
    {
        ten = "B"
    }
    else if Int(ten) == 38
    {
        ten = "C"
    }
    else if Int(ten) == 39
    {
        ten = "D"
    }
    else if Int(ten) == 40
    {
        ten = "E"
    }
    else if Int(ten) == 41
    {
        ten = "F"
    }
    else if Int(ten) == 42
    {
        ten = "G"
    }
    else if Int(ten) == 43
    {
        ten = "H"
    }
    else if Int(ten) == 44
    {
        ten = "I"
    }
    else if Int(ten) == 45
    {
        ten = "J"
    }
    else if Int(ten) == 46
    {
        ten = "K"
    }
    else if Int(ten) == 47
    {
        ten = "L"
    }
    else if Int(ten) == 48
    {
        ten = "M"
    }
    else if Int(ten) == 49
    {
        ten = "N"
    }
    else if Int(ten) == 50
    {
        ten = "O"
    }
    else if Int(ten) == 51
    {
        ten = "P"
    }
    else if Int(ten) == 52
    {
        ten = "Q"
    }
    else if Int(ten) == 53
    {
        ten = "R"
    }
    else if Int(ten) == 54
    {
        ten = "S"
    }
    else if Int(ten) == 55
    {
        ten = "T"
    }
    else if Int(ten) == 56
    {
        ten = "U"
    }
    else if Int(ten) == 57
    {
        ten = "V"
    }
    else if Int(ten) == 58
    {
        ten = "W"
    }
    else if Int(ten) == 59
    {
        ten = "X"
    }
    else if Int(ten) == 60
    {
        ten = "Y"
    }
    else if Int(ten) == 61
    {
        ten = "Z"
    }

    var newRandomPass = "" + one + "" + two + "" + three + "" + four + "" + five + "" + six + "" + seven + "" + eight + "" + nine + "" + ten

        
    return newRandomPass
}



    /*
    // MARK
    { - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue
    { UIStoryboardSegue, sender
    { Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
