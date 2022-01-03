//
//  AddInfoPage.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 8/14/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import UIKit

class AddInfoPage: UIViewController {
    
    
    @IBOutlet weak var InfoTitle: UITextField!
    @IBOutlet weak var Info: UITextView!
    
    
    @IBOutlet weak var WarningLabel: UILabel!
    
    var userInfoPasswords = [String:[String:String]]()
    var users = [String:String]()
    var names = [String:String]()
    var ciphers = [String:String]()
    var username = ""
    var password = ""
    
    var infoPasswordAdded = false
    
    var page = "info"
    
    var color1 = UIColor()
    var color2 = UIColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WarningLabel.isHidden = true
        Info.backgroundColor = UIColor.white

        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
        
        
        InfoTitle.attributedPlaceholder = NSAttributedString(string: "Info Title", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var mainController = segue.destination as! Main
        mainController.userInfoPasswords = self.userInfoPasswords
        mainController.infoPasswordAdded = self.infoPasswordAdded
        mainController.users = self.users
        mainController.names = self.names
        mainController.ciphers = self.ciphers
        mainController.username = self.username
        mainController.password = self.password
        mainController.page = self.page
    }
    

    
    @IBAction func BackToMain(_ sender: UIButton) {
        performSegue(withIdentifier: "NewInfoToMain", sender: self)
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
    
    
    @IBAction func Create(_ sender: UIButton) {
        
        var infoTitle = InfoTitle.text!
        var info  = Info.text!
        
        if InfoTitle.text!.count > 0 && Info.text!.count > 0
        {
            var infoSet = adjustedEncrypt(info, decryption1(ciphers[username]!))
            print(infoSet)
            userInfoPasswords[username]![infoTitle] = infoSet
            infoPasswordAdded = true
            WarningLabel.isHidden = true
            performSegue(withIdentifier: "NewInfoToMain", sender: self)
        }
        else
        {
            WarningLabel.isHidden = false
        }
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
