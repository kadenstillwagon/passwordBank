//
//  Main.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 8/13/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import UIKit
import Foundation




class Main: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var Menu: UIStackView!
    @IBOutlet weak var MenuLabel: UILabel!
    @IBOutlet weak var MenuLabelBackground: UIView!
    
    
    @IBOutlet var SwipeRightGesture: UISwipeGestureRecognizer!
    @IBOutlet var SwipeLeftGesture: UISwipeGestureRecognizer!
    
    
    @IBOutlet weak var SearchBarAccount: UIStackView!
    @IBOutlet weak var SearchBarDevice: UIStackView!
    @IBOutlet weak var SearchBarCard: UIStackView!
    @IBOutlet weak var SearchBarInfo: UIStackView!
    
    
    @IBOutlet weak var FullAccountSearchBar: UIView!
    @IBOutlet weak var FullDeviceSearchBar: UIView!
    @IBOutlet weak var FullCardSearchBar: UIView!
    @IBOutlet weak var FullInfoSearchBar: UIView!
    
    
    @IBOutlet weak var DecryptingLabel: UILabel!
    @IBOutlet weak var DecryptingActivityIndicator: UIActivityIndicatorView!
    
    
    
    @IBOutlet weak var redColor: UIButton!
    @IBOutlet weak var blueColor: UIButton!
    @IBOutlet weak var purpleColor: UIButton!
    @IBOutlet weak var orangeColor: UIButton!
    @IBOutlet weak var greenColor: UIButton!
    @IBOutlet weak var yellowColor: UIButton!
    
    @IBOutlet weak var SetBackgroundButton: UIButton!
    @IBOutlet weak var ChangeUsernameButton: UIButton!
    @IBOutlet weak var ResetPasswordButton: UIButton!
    @IBOutlet weak var DeleteAccountButton: UIButton!
    
    @IBOutlet weak var AccountMenuLabel: UILabel!
    @IBOutlet weak var BackgroundMenuLabel: UILabel!
    
    
    
    
    @IBOutlet weak var AccountsView: UIView!
    @IBOutlet weak var DevicesView: UIView!
    @IBOutlet weak var CardsView: UIView!
    @IBOutlet weak var InfoView: UIView!
    
    @IBOutlet weak var AccountSearchBar: UITextField!
    @IBOutlet weak var DeviceSearchBar: UITextField!
    @IBOutlet weak var CardSearchBar: UITextField!
    @IBOutlet weak var InfoSearchBar: UITextField!
    
    
    @IBOutlet weak var AccountViewHeight: NSLayoutConstraint!
    @IBOutlet weak var DeviceViewHeight: NSLayoutConstraint!
    @IBOutlet weak var CardViewHeight: NSLayoutConstraint!
    @IBOutlet weak var InfoViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var AccountsButton: UIButton!
    @IBOutlet weak var DevicesButton: UIButton!
    @IBOutlet weak var CardsButton: UIButton!
    @IBOutlet weak var InfoButton: UIButton!
    
    @IBOutlet weak var WelcomeLabel: UILabel!
    
    
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var SignOutButton: UIButton!
    @IBOutlet weak var SettingsButton: UIButton!
    
    
    @IBOutlet weak var NewPasswordMenu: UIStackView!
    
    var passIdentifier = ""
    
    var users = [String:String]()
    var names = [String:String]()
    var ciphers = [String:String]()
    
    var userAccountPasswords = [String:[String:String]]()
    var userDevicePasswords = [String:[String:String]]()
    var userCardPasswords = [String:[String:[String]]]()
    var userInfoPasswords = [String:[String:String]]()//will need to be changed
    
    
    var username = ""
    var password = ""
    
    
    var addTapped = false
    var settingsTapped = false
    
    var newAccount = false
    var newDevice = false
    var newCard = false
    var newInfo = false
    
    var viewAccount = false
    var viewDevice = false
    var viewCard = false
    var viewInfo = false
    
    var usernameChange = false
    var passwordChange = false
    var accountDelete = false
    
    var usernameChanged = false
    var passwordChanged = false
    
    var signOut = false
    
    
    var accountPasswordAdded = false
    var devicePasswordAdded = false
    var cardPasswordAdded = false
    var infoPasswordAdded = false
    
    var accountPasswordChanged = false
    var devicePasswordChanged = false
    var cardPasswordChanged = false
    var infoPasswordChanged = false
    
    
    var accountPasswordsY = 2
    var devicePasswordsY = 2
    var cardPasswordsY = 2
    var infoPasswordsY = 2
    
    var AccountIdentifiers = [Int:String]()
    var DeviceIdentifiers = [Int:String]()
    var CardIdentifiers = [Int:String]()
    var InfoIdentifiers = [Int:String]()
    
    var AccountButtonIdentifiers = [Int:UIButton]()
    var DeviceButtonIdentifiers = [Int:UIButton]()
    var CardButtonIdentifiers = [Int:UIButton]()
    var InfoButtonIdentifiers = [Int:UIButton]()
    
    var swiped = false
    
    var menuOpen = false
    var alpha1: Float = 0.0
    var alpha2: Float = 0.0
    var alpha3: Float = 0.0
    var alpha4: Float = 0.0
    var alpha5: Float = 0.0
    var alpha6: Float = 0.0
    
    var infoPassword = ""
    
    
    let gradient = CAGradientLayer()//background gradient
    let gradient3 = CAGradientLayer()//menu label gradient
    
    let accountSearchGradient = CAGradientLayer()//search bar gradients
    let deviceSearchGradient = CAGradientLayer()
    let cardSearchGradient = CAGradientLayer()
    let infoSearchGradient = CAGradientLayer()
    
    let decryptingEffectGradient = CAGradientLayer()
    
    
    var color1 = UIColor(named: "color11")!
    var color2 = UIColor(named: "color19")!
    
    var settingsOpenCompleted = false
    var settingsCloseCompleted = true
    
    var page = "accounts"
    
    var place = "notFromLogIn"
    
    var timer = Timer()
    var welcomeTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DecryptingLabel.isHidden = true
        DecryptingActivityIndicator.isHidden = true
        
        newAccount = false
        newDevice = false
        newCard = false
        newInfo = false
           
        viewAccount = false
        viewDevice = false
        viewCard = false
        viewInfo = false
        
        signOut = false
        
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(SignOut), userInfo: nil, repeats: false)//starts timer
        
        SwipeRightGesture.direction = .right
        SwipeLeftGesture.direction = .left
        
        ScrollView.panGestureRecognizer.addTarget(self, action: #selector(scrolling))
        
         gradient.frame = view.bounds
         gradient.colors = [UIColor(named: "color11")!.cgColor, UIColor(named: "color19")!.cgColor]
         gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0.7)
         view.layer.insertSublayer(gradient, at: 0)//sets background color
        
        
        
        AddButton.tintColor = UIColor.white
        SignOutButton.setTitleColor(UIColor.white, for: .normal)
        
        
        redColor.backgroundColor = UIColor.black//sets all buttons as black so under layer won't show
        blueColor.backgroundColor = UIColor.black
        purpleColor.backgroundColor = UIColor.black
        orangeColor.backgroundColor = UIColor.black
        greenColor.backgroundColor = UIColor.black
        yellowColor.backgroundColor = UIColor.black
        
        setUpColorButtons()//sets up buttons with gradient colors
        
        ChangeUsernameButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)//adds borders to buttons in settings
        ChangeUsernameButton.layer.borderWidth = 2
        ResetPasswordButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        ResetPasswordButton.layer.borderWidth = 2
        DeleteAccountButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        DeleteAccountButton.layer.borderWidth = 2
        SetBackgroundButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        SetBackgroundButton.layer.borderWidth = 2
        SetBackgroundButton.layer.cornerRadius = 5
        
        AccountMenuLabel.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        AccountMenuLabel.layer.borderWidth = 1
        BackgroundMenuLabel.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        BackgroundMenuLabel.layer.borderWidth = 1
        

        Menu.layer.borderColor = CGColor(red: 55, green: 55, blue: 55, alpha: 1)
        Menu.layer.borderWidth = 2
        Menu.layer.cornerRadius = 5
        
        
        NewPasswordMenu.isHidden = true
        NewPasswordMenu.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        
        
        
        
        if let x = UserDefaults.standard.object(forKey: "alpha1") as? Float
        {
            alpha1 = x
        }
        if let y = UserDefaults.standard.object(forKey: "alpha2") as? Float
        {
            alpha2 = y
        }
        if let z = UserDefaults.standard.object(forKey: "alpha3") as? Float
        {
            alpha3 = z
        }
        if let x = UserDefaults.standard.object(forKey: "alpha4") as? Float
        {
            alpha4 = x
        }
        if let y = UserDefaults.standard.object(forKey: "alpha5") as? Float
        {
            alpha5 = y
        }
        if let z = UserDefaults.standard.object(forKey: "alpha6") as? Float
        {
            alpha6 = z
        }
        Menu.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        Menu.isHidden = true
        menuOpen = false
        
        
        color1 = UIColor(hue: CGFloat(alpha1), saturation: CGFloat(alpha2), brightness: CGFloat(alpha3), alpha: 1.0)//sets background color
        color2 = UIColor(hue: CGFloat(alpha4), saturation: CGFloat(alpha5), brightness: CGFloat(alpha6), alpha: 1.0)
        
        
        setTheme(color1, color2)
        
        
        
        
        
        if accountPasswordAdded == true || accountPasswordChanged == true
        {
            UserDefaults.standard.set(userAccountPasswords, forKey: "userAccountPasswords")
            accountPasswordAdded = false
            accountPasswordChanged = false
        }
        if devicePasswordAdded == true || devicePasswordChanged == true
        {
            UserDefaults.standard.set(userDevicePasswords, forKey: "userDevicePasswords")
            devicePasswordAdded = false
            devicePasswordChanged = false
        }
        if cardPasswordAdded == true || cardPasswordChanged == true
        {
            UserDefaults.standard.set(userCardPasswords, forKey: "userCardPasswords")
            cardPasswordAdded = false
            cardPasswordChanged = false
        }
        if infoPasswordAdded == true || infoPasswordChanged == true
        {
            UserDefaults.standard.set(userInfoPasswords, forKey: "userInfoPasswords")
            infoPasswordAdded = false
            infoPasswordChanged = false
        }


        if let a = UserDefaults.standard.object(forKey: "userAccountPasswords") as? [String:[String:String]]
        {
            userAccountPasswords = a
        }
        if let b = UserDefaults.standard.object(forKey: "userDevicePasswords") as? [String:[String:String]]
        {
            userDevicePasswords = b
        }
        if let c = UserDefaults.standard.object(forKey: "userCardPasswords") as? [String:[String:[String]]]
        {
            userCardPasswords = c
        }
        if let d = UserDefaults.standard.object(forKey: "userInfoPasswords") as? [String:[String:String]]
        {
            userInfoPasswords = d
        }
        
//        print(userInfoPasswords[username]!["TestingFunctions_medicalAI"]!)
//        print(decrypt(userInfoPasswords[username]!["TestingFunctions_medicalAI"]!, decryption1(ciphers[username]!)))
        
        //encrypting all passwords
        
//        for key in userAccountPasswords[username]!
//        {
//            userAccountPasswords[username]![key.key]! = encrypt(userAccountPasswords[username]![key.key]!, decryption1(ciphers[username]!))
//
//            print(userAccountPasswords[username]![key.key]!)
//
//        }
//        UserDefaults.standard.set(userAccountPasswords, forKey: "userAccountPasswords")
//
//
//        for key in userDevicePasswords[username]!
//        {
//            userDevicePasswords[username]![key.key]! = encrypt(userDevicePasswords[username]![key.key]!, decryption1(ciphers[username]!))
//
//            print(userDevicePasswords[username]![key.key]!)
//
//        }
//        UserDefaults.standard.set(userDevicePasswords, forKey: "userDevicePasswords")
//
//
//        for key in userCardPasswords[username]!
//        {
//            for num in Range(0...3)
//            {
//                userCardPasswords[username]![key.key]![num] = encrypt(userCardPasswords[username]![key.key]![num], decryption1(ciphers[username]!))
//
//                print(userCardPasswords[username]![key.key]![num])
//            }
//
//        }
//        UserDefaults.standard.set(userCardPasswords, forKey: "userCardPasswords")

        
        
        //resets all info


  
//            userInfoPasswords = [username:[" ":" "]]
//
//
//        
//        UserDefaults.standard.set(userInfoPasswords, forKey: "userInfoPasswords")
//
//
//        print("ACCOUNTS")
//        print(userAccountPasswords)
//        print("DEVICES")
//        print(userDevicePasswords)
//        print("CARDS")
//        print(userCardPasswords)
//        print("INFO")
//        print(userInfoPasswords)
        
        
        if userAccountPasswords[username] != nil
        {
            var accountPasswords = [String]()
            for key in userAccountPasswords[username]!
            {
                accountPasswords.append(key.key)
            }
            accountPasswords.sort()
            var accountCount = 0
            
            for key in userAccountPasswords[username]!
            {
                let button: UIButton = UIButton()
                button.frame = CGRect(x: 0, y: CGFloat(accountPasswordsY), width: self.AccountsView.frame.width, height: 50)
                button.backgroundColor = UIColor(named: "color41")
                button.setTitle(" "+accountPasswords[accountCount], for: .normal)
                button.contentHorizontalAlignment = .left
                button.accessibilityIdentifier = ""+accountPasswords[accountCount]
                button.tag = accountCount
                AccountIdentifiers[button.tag] = button.accessibilityIdentifier
                AccountButtonIdentifiers[button.tag] = button
                button.addTarget(self, action: #selector(OpenAccountPassword), for: .touchUpInside)
//                button.addTarget(self, action: #selector(OpenAccountPassOptions), for: .touchDragInside)
                self.AccountsView.addSubview(button)
                accountPasswordsY += 52
                accountCount += 1
                
                let gradient = CAGradientLayer()
                gradient.frame = button.bounds
                gradient.colors = [UIColor(named: "color41")!.cgColor, UIColor(named: "color3")!.cgColor]
                gradient.shouldRasterize = true
                gradient.startPoint = CGPoint(x: 1, y: 0)
                gradient.endPoint = CGPoint(x: 0, y: 1)
                button.layer.insertSublayer(gradient, at: 0)
            }
            
        }
        
        if userDevicePasswords[username] != nil
        {
            var devicePasswords = [String]()
            for key in userDevicePasswords[username]!
            {
                devicePasswords.append(key.key)
            }
            devicePasswords.sort()
            var deviceCount = 0
            
            
            for key in userDevicePasswords[username]!
            {
                let button: UIButton = UIButton()
                button.frame = CGRect(x: 0, y: CGFloat(devicePasswordsY), width: self.DevicesView.frame.width, height: 50)
                button.backgroundColor = UIColor(named: "color41")
                button.setTitle(" "+devicePasswords[deviceCount], for: .normal)
                button.contentHorizontalAlignment = .left
                button.accessibilityIdentifier = ""+devicePasswords[deviceCount]
                button.tag = deviceCount
                DeviceIdentifiers[button.tag] = button.accessibilityIdentifier
                DeviceButtonIdentifiers[button.tag] = button
                button.addTarget(self, action: #selector(OpenDevicePassword), for: .touchUpInside)
                self.DevicesView.addSubview(button)
                devicePasswordsY += 52
                deviceCount += 1
                
                let gradient = CAGradientLayer()
                gradient.frame = button.bounds
                gradient.colors = [UIColor(named: "color41")!.cgColor, UIColor(named: "color3")!.cgColor]
                gradient.shouldRasterize = true
                gradient.startPoint = CGPoint(x: 1, y: 0)
                gradient.endPoint = CGPoint(x: 0, y: 1)
                button.layer.insertSublayer(gradient, at: 0)
            }
        }
        
        if userCardPasswords[username] != nil
        {
            var cardPasswords = [String]()
            for key in userCardPasswords[username]!
            {
                cardPasswords.append(key.key)
            }
            cardPasswords.sort()
            var cardCount = 0
            
            
            for key in userCardPasswords[username]!
            {
                let button: UIButton = UIButton()
                button.frame = CGRect(x: 0, y: CGFloat(cardPasswordsY), width: self.CardsView.frame.width, height: 50)
                button.backgroundColor = UIColor(named: "color41")
                button.setTitle(" "+cardPasswords[cardCount], for: .normal)
                button.contentHorizontalAlignment = .left
                button.accessibilityIdentifier = ""+cardPasswords[cardCount]
                button.tag = cardCount
                CardIdentifiers[button.tag] = button.accessibilityIdentifier
                CardButtonIdentifiers[button.tag] = button
                button.addTarget(self, action: #selector(OpenCardPassword), for: .touchUpInside)
                self.CardsView.addSubview(button)
                cardPasswordsY += 52
                cardCount += 1
                
                let gradient = CAGradientLayer()
                gradient.frame = button.bounds
                gradient.colors = [UIColor(named: "color41")!.cgColor, UIColor(named: "color3")!.cgColor]
                gradient.shouldRasterize = true
                gradient.startPoint = CGPoint(x: 1, y: 0)
                gradient.endPoint = CGPoint(x: 0, y: 1)
                button.layer.insertSublayer(gradient, at: 0)
            }
        }
        
        if userInfoPasswords[username] != nil
        {
            var infoPasswords = [String]()
            for key in userInfoPasswords[username]!
            {
                infoPasswords.append(key.key)
            }
            infoPasswords.sort()
            var infoCount = 0
            
            
            for key in userInfoPasswords[username]!
            {
                let button: UIButton = UIButton()
                button.frame = CGRect(x: 0, y: CGFloat(infoPasswordsY), width: self.InfoView.frame.width, height: 50)
                button.backgroundColor = UIColor(named: "color41")
                button.setTitle(" "+infoPasswords[infoCount], for: .normal)
                button.contentHorizontalAlignment = .left
                button.accessibilityIdentifier = ""+infoPasswords[infoCount]
                button.tag = infoCount
                InfoIdentifiers[button.tag] = button.accessibilityIdentifier
                InfoButtonIdentifiers[button.tag] = button
                button.addTarget(self, action: #selector(OpenInfoPassword), for: .touchUpInside)
                self.InfoView.addSubview(button)
                infoPasswordsY += 52
                infoCount += 1
                
                let gradient = CAGradientLayer()
                gradient.frame = button.bounds
                gradient.colors = [UIColor(named: "color41")!.cgColor, UIColor(named: "color3")!.cgColor]
                gradient.shouldRasterize = true
                gradient.startPoint = CGPoint(x: 1, y: 0)
                gradient.endPoint = CGPoint(x: 0, y: 1)
                button.layer.insertSublayer(gradient, at: 0)
            }
        }
        
        
        

        
        
        
        
        
        
        
        //Sets which page is opened when returning to menu
        if page == "accounts"{
            
            AccountsView.isHidden = false
            SearchBarAccount.isHidden = false
            AccountsButton.backgroundColor = UIColor.lightGray
            
            
            DevicesView.isHidden = true
            SearchBarDevice.isHidden = true
            CardsView.isHidden = true
            SearchBarCard.isHidden = true
            InfoView.isHidden = true
            SearchBarInfo.isHidden = true
            
            if accountPasswordsY > 585
            {
                ScrollView.isScrollEnabled = true
            }
            else
            {
                ScrollView.isScrollEnabled = false
            }
            
            AccountViewHeight.constant = CGFloat(accountPasswordsY)
            DeviceViewHeight.constant = CGFloat(accountPasswordsY)
            CardViewHeight.constant = CGFloat(accountPasswordsY)
            InfoViewHeight.constant = CGFloat(accountPasswordsY)
        }
        if page == "devices"{
            
            DevicesView.isHidden = false
            SearchBarDevice.isHidden = false
            DevicesButton.backgroundColor = UIColor.lightGray
            
            
            AccountsView.isHidden = true
            SearchBarAccount.isHidden = true
            CardsView.isHidden = true
            SearchBarCard.isHidden = true
            InfoView.isHidden = true
            SearchBarInfo.isHidden = true
            
            if devicePasswordsY > 585
            {
                ScrollView.isScrollEnabled = true
            }
            else
            {
                ScrollView.isScrollEnabled = false
            }
            
            AccountViewHeight.constant = CGFloat(devicePasswordsY)
            DeviceViewHeight.constant = CGFloat(devicePasswordsY)
            CardViewHeight.constant = CGFloat(devicePasswordsY)
            InfoViewHeight.constant = CGFloat(devicePasswordsY)
        }
        if page == "cards"{
            
            CardsView.isHidden = false
            SearchBarCard.isHidden = false
            CardsButton.backgroundColor = UIColor.lightGray
            
            
            DevicesView.isHidden = true
            SearchBarDevice.isHidden = true
            AccountsView.isHidden = true
            SearchBarAccount.isHidden = true
            InfoView.isHidden = true
            SearchBarInfo.isHidden = true
            
            
            if cardPasswordsY > 585
            {
                ScrollView.isScrollEnabled = true
            }
            else
            {
                ScrollView.isScrollEnabled = false
            }
            
            AccountViewHeight.constant = CGFloat(cardPasswordsY)
            DeviceViewHeight.constant = CGFloat(cardPasswordsY)
            CardViewHeight.constant = CGFloat(cardPasswordsY)
            InfoViewHeight.constant = CGFloat(cardPasswordsY)
        }
        if page == "info"{
            
            InfoView.isHidden = false
            SearchBarInfo.isHidden = false
            InfoButton.backgroundColor = UIColor.lightGray
            
            
            DevicesView.isHidden = true
            SearchBarDevice.isHidden = true
            CardsView.isHidden = true
            SearchBarCard.isHidden = true
            AccountsView.isHidden = true
            SearchBarAccount.isHidden = true
            
            
            if infoPasswordsY > 585
            {
                ScrollView.isScrollEnabled = true
            }
            else
            {
                ScrollView.isScrollEnabled = false
            }
            
            AccountViewHeight.constant = CGFloat(infoPasswordsY)
            DeviceViewHeight.constant = CGFloat(infoPasswordsY)
            CardViewHeight.constant = CGFloat(infoPasswordsY)
            InfoViewHeight.constant = CGFloat(infoPasswordsY)
        }
        
        if place == "fromLogIn"
        {
            
            var firstName: Substring = ""
            var name = decrypt(names[username]!, decryption1(ciphers[username]!))
            var NAME = name
            
            var index: Int = 0
            let str = NAME
            if let firstIndex = str.firstIndex(of: " ") {
                index = str.distance(from: str.startIndex, to: firstIndex)
                firstName = name.prefix(index)
            }
            else {
                firstName = Substring(name)
            }
            
            if firstName.count > 12
            {
                firstName = firstName.prefix(12)
                firstName += "..."
            }
            WelcomeLabel.text = "Welcome, "+firstName
            
            
            WelcomeLabel.isHidden = false
            AddButton.isHidden = true
            
            welcomeTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(Welcome), userInfo: nil, repeats: false)//starts Welcome timer
        }
        
        else
        {
            WelcomeLabel.isHidden = true
            AddButton.isHidden = false
        }
       
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        timer.invalidate()
        if signOut == true
        {
            
        }
        else
        {
            if newAccount == true
            {
                var accountController = segue.destination as! AddAccountPage
                accountController.userAccountPasswords = self.userAccountPasswords
                accountController.users = self.users
                accountController.names = self.names
                accountController.ciphers = self.ciphers
                accountController.username = self.username
                accountController.password = self.password
                accountController.color1 = self.color1
                accountController.color2 = self.color2
                newAccount = false
            }
            if newDevice == true
            {
                var deviceController = segue.destination as! AddDevicePage
                deviceController.userDevicePasswords = self.userDevicePasswords
                deviceController.users = self.users
                deviceController.names = self.names
                deviceController.ciphers = self.ciphers
                deviceController.username = self.username
                deviceController.password = self.password
                deviceController.color1 = self.color1
                deviceController.color2 = self.color2
                newDevice = false
            }
            if newCard == true
            {
                var cardController = segue.destination as! AddCardPage
                cardController.userCardPasswords = self.userCardPasswords
                cardController.users = self.users
                cardController.names = self.names
                cardController.ciphers = self.ciphers
                cardController.username = self.username
                cardController.password = self.password
                cardController.color1 = self.color1
                cardController.color2 = self.color2
                newCard = false
            }
            if newInfo == true
            {
                var infoController = segue.destination as! AddInfoPage
                infoController.userInfoPasswords = self.userInfoPasswords
                infoController.users = self.users
                infoController.names = self.names
                infoController.ciphers = self.ciphers
                infoController.username = self.username
                infoController.password = self.password
                infoController.color1 = self.color1
                infoController.color2 = self.color2
                newInfo = false
            }
            
            
            
            
            if viewAccount == true
            {
                let accountController = segue.destination as! AccountPasswordPage
                accountController.userAccountPasswords = self.userAccountPasswords
                accountController.users = self.users
                accountController.names = self.names
                accountController.ciphers = self.ciphers
                accountController.username = self.username
                accountController.passIdentifier = self.passIdentifier
                accountController.password = self.password
                accountController.color1 = self.color1
                accountController.color2 = self.color2
                newAccount = false
            }
            
            if viewDevice == true
            {
                let deviceController = segue.destination as! DevicePasswordPage
                deviceController.userDevicePasswords = self.userDevicePasswords
                deviceController.users = self.users
                deviceController.names = self.names
                deviceController.ciphers = self.ciphers
                deviceController.username = self.username
                deviceController.passIdentifier = self.passIdentifier
                deviceController.password = self.password
                deviceController.color1 = self.color1
                deviceController.color2 = self.color2
                newDevice = false
            }
            
            if viewCard == true
            {
                let cardController = segue.destination as! CardPasswordPage
                cardController.userCardPasswords = self.userCardPasswords
                cardController.users = self.users
                cardController.names = self.names
                cardController.ciphers = self.ciphers
                cardController.username = self.username
                cardController.passIdentifier = self.passIdentifier
                cardController.password = self.password
                cardController.color1 = self.color1
                cardController.color2 = self.color2
                newCard = false
            }
            
            if viewInfo == true
            {
                let infoController = segue.destination as! InfoPasswordPage
                infoController.userInfoPasswords = self.userInfoPasswords
                infoController.users = self.users
                infoController.names = self.names
                infoController.ciphers = self.ciphers
                infoController.username = self.username
                infoController.passIdentifier = self.passIdentifier
                infoController.password = self.password
                infoController.infoPassword = self.infoPassword
                infoController.color1 = self.color1
                infoController.color2 = self.color2
                newInfo = false
            }
            
            
            
            
            
            
            //accountEdit Segues
            
            if usernameChange == true
            {
                let usernameChangeController = segue.destination as! AccountEditPage
                usernameChangeController.userAccountPasswords = self.userAccountPasswords
                usernameChangeController.userDevicePasswords = self.userDevicePasswords
                usernameChangeController.userCardPasswords = self.userCardPasswords
                usernameChangeController.userInfoPasswords = self.userInfoPasswords
                usernameChangeController.usernameChange = self.usernameChange
                usernameChangeController.passwordChange = self.passwordChange
                usernameChangeController.accountDelete = self.accountDelete
                usernameChangeController.users = self.users
                usernameChangeController.names = self.names
                usernameChangeController.ciphers = self.ciphers
                usernameChangeController.username = self.username
                usernameChangeController.password = self.password
                usernameChangeController.color1 = self.color1
                usernameChangeController.color2 = self.color2
                newInfo = false
            }
            
            if passwordChange == true
            {
                let passwordChangeController = segue.destination as! AccountEditPage
                passwordChangeController.userAccountPasswords = self.userAccountPasswords
                passwordChangeController.userDevicePasswords = self.userDevicePasswords
                passwordChangeController.userCardPasswords = self.userCardPasswords
                passwordChangeController.userInfoPasswords = self.userInfoPasswords
                passwordChangeController.usernameChange = self.usernameChange
                passwordChangeController.passwordChange = self.passwordChange
                passwordChangeController.accountDelete = self.accountDelete
                passwordChangeController.users = self.users
                passwordChangeController.names = self.names
                passwordChangeController.ciphers = self.ciphers
                passwordChangeController.username = self.username
                passwordChangeController.password = self.password
                passwordChangeController.color1 = self.color1
                passwordChangeController.color2 = self.color2
                newInfo = false
            }
            
            if accountDelete == true
            {
                let acccountDeleteController = segue.destination as! AccountEditPage
                acccountDeleteController.userAccountPasswords = self.userAccountPasswords
                acccountDeleteController.userDevicePasswords = self.userDevicePasswords
                acccountDeleteController.userCardPasswords = self.userCardPasswords
                acccountDeleteController.userInfoPasswords = self.userInfoPasswords
                acccountDeleteController.usernameChange = self.usernameChange
                acccountDeleteController.passwordChange = self.passwordChange
                acccountDeleteController.accountDelete = self.accountDelete
                acccountDeleteController.users = self.users
                acccountDeleteController.names = self.names
                acccountDeleteController.ciphers = self.ciphers
                acccountDeleteController.username = self.username
                acccountDeleteController.password = self.password
                acccountDeleteController.color1 = self.color1
                acccountDeleteController.color2 = self.color2
                newInfo = false
            }
        }
        
    }
    
    
    func setTheme(_ color1: UIColor, _ color2: UIColor){
        
        
        gradient.frame = view.bounds//sets background gradient
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0.7)
        view.layer.insertSublayer(gradient, at: 0)
        
        
        gradient3.frame = MenuLabelBackground.bounds//sets settings label gradient
        gradient3.colors = [color1.cgColor,color2.cgColor]
        gradient3.shouldRasterize = true
        gradient3.startPoint = CGPoint(x: 0, y: 1)
        gradient3.endPoint = CGPoint(x: 1, y: 0)
        MenuLabelBackground.layer.insertSublayer(gradient3, at: 0)
        
        
        //sets search bar gradients
        
        accountSearchGradient.frame = FullAccountSearchBar.bounds
        accountSearchGradient.colors = [color1.cgColor,color2.cgColor]
        accountSearchGradient.shouldRasterize = true
        accountSearchGradient.startPoint = CGPoint(x: 0, y: 1)
        accountSearchGradient.endPoint = CGPoint(x: 1, y: 0)
        FullAccountSearchBar.layer.insertSublayer(accountSearchGradient, at: 0)
        
        FullAccountSearchBar.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        FullAccountSearchBar.layer.borderWidth = 0.5
        
        
        deviceSearchGradient.frame = FullDeviceSearchBar.bounds
        deviceSearchGradient.colors = [color1.cgColor,color2.cgColor]
        deviceSearchGradient.shouldRasterize = true
        deviceSearchGradient.startPoint = CGPoint(x: 0, y: 1)
        deviceSearchGradient.endPoint = CGPoint(x: 1, y: 0)
        FullDeviceSearchBar.layer.insertSublayer(deviceSearchGradient, at: 0)
        
        FullDeviceSearchBar.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        FullDeviceSearchBar.layer.borderWidth = 0.5
        
        
        cardSearchGradient.frame = FullCardSearchBar.bounds
        cardSearchGradient.colors = [color1.cgColor,color2.cgColor]
        cardSearchGradient.shouldRasterize = true
        cardSearchGradient.startPoint = CGPoint(x: 0, y: 1)
        cardSearchGradient.endPoint = CGPoint(x: 1, y: 0)
        FullCardSearchBar.layer.insertSublayer(cardSearchGradient, at: 0)
        
        FullCardSearchBar.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        FullCardSearchBar.layer.borderWidth = 0.5
        
        infoSearchGradient.frame = FullInfoSearchBar.bounds
        infoSearchGradient.colors = [color1.cgColor,color2.cgColor]
        infoSearchGradient.shouldRasterize = true
        infoSearchGradient.startPoint = CGPoint(x: 0, y: 1)
        infoSearchGradient.endPoint = CGPoint(x: 1, y: 0)
        FullInfoSearchBar.layer.insertSublayer(infoSearchGradient, at: 0)
        
        FullInfoSearchBar.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        FullInfoSearchBar.layer.borderWidth = 0.5
        
//        decryptingEffectGradient.frame = DecryptingEffect.bounds
//        decryptingEffectGradient.colors = [color1.cgColor,color2.cgColor]
//        decryptingEffectGradient.shouldRasterize = true
//        decryptingEffectGradient.startPoint = CGPoint(x: 0, y: 1)
//        decryptingEffectGradient.endPoint = CGPoint(x: 1, y: 0)
//        DecryptingEffect.layer.insertSublayer(decryptingEffectGradient, at: 0)
        
        
    }
    
    
    
    func setUpColorButtons(){
        alpha1 = 1.0; alpha2 = 1.0; alpha3 = 0.76047903; alpha4 = 0.0; alpha5 = 1.0; alpha6 = 0.26047903

        let gradient2 = CAGradientLayer()
        gradient2.frame = redColor.bounds
        gradient2.colors = [UIColor(hue: CGFloat(alpha1), saturation: CGFloat(alpha2), brightness: CGFloat(alpha3), alpha: 1.0).cgColor, UIColor(hue: CGFloat(alpha4), saturation: CGFloat(alpha5), brightness: CGFloat(alpha6), alpha: 1.0).cgColor]
        gradient2.shouldRasterize = true
        gradient2.startPoint = CGPoint(x: 1, y: 0)
        gradient2.endPoint = CGPoint(x: 0, y: 1)
        redColor.layer.insertSublayer(gradient2, at: 0)
        redColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        redColor.layer.borderWidth = 2

        
        alpha1 = 0.6317365; alpha2 = 0.7305389; alpha3 = 1.0; alpha4 = 0.65868264; alpha5 = 1.0; alpha6 = 0.14670658
        
        let gradient3 = CAGradientLayer()
        gradient3.frame = redColor.bounds
        gradient3.colors = [UIColor(hue: CGFloat(alpha1), saturation: CGFloat(alpha2), brightness: CGFloat(alpha3), alpha: 1.0).cgColor, UIColor(hue: CGFloat(alpha4), saturation: CGFloat(alpha5), brightness: CGFloat(alpha6), alpha: 1.0).cgColor]
        gradient3.shouldRasterize = true
        gradient3.startPoint = CGPoint(x: 1, y: 0)
        gradient3.endPoint = CGPoint(x: 0, y: 1)
        blueColor.layer.insertSublayer(gradient3, at: 0)
        blueColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        blueColor.layer.borderWidth = 2
        
        
        alpha1 = 0.8293413; alpha2 = 1.0; alpha3 = 0.38622755; alpha4 = 0.66467065; alpha5 = 0.7994012; alpha6 = 0.31437126
        
        let gradient4 = CAGradientLayer()
        gradient4.frame = redColor.bounds
        gradient4.colors = [UIColor(hue: CGFloat(alpha1), saturation: CGFloat(alpha2), brightness: CGFloat(alpha3), alpha: 1.0).cgColor, UIColor(hue: CGFloat(alpha4), saturation: CGFloat(alpha5), brightness: CGFloat(alpha6), alpha: 1.0).cgColor]
        gradient4.shouldRasterize = true
        gradient4.startPoint = CGPoint(x: 1, y: 0)
        gradient4.endPoint = CGPoint(x: 0, y: 1)
        purpleColor.layer.insertSublayer(gradient4, at: 0)
        purpleColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        purpleColor.layer.borderWidth = 2

        
        alpha1 = 0.056886226; alpha2 = 1.0; alpha3 = 0.8203593; alpha4 = 1.0; alpha5 = 1.0; alpha6 = 0.24550898
        
        let gradient5 = CAGradientLayer()
        gradient5.frame = redColor.bounds
        gradient5.colors = [UIColor(hue: CGFloat(alpha1), saturation: CGFloat(alpha2), brightness: CGFloat(alpha3), alpha: 1.0).cgColor, UIColor(hue: CGFloat(alpha4), saturation: CGFloat(alpha5), brightness: CGFloat(alpha6), alpha: 1.0).cgColor]
        gradient5.shouldRasterize = true
        gradient5.startPoint = CGPoint(x: 1, y: 0)
        gradient5.endPoint = CGPoint(x: 0, y: 1)
        orangeColor.layer.insertSublayer(gradient5, at: 0)
        orangeColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        orangeColor.layer.borderWidth = 2
        
        
        alpha1 = 0.3023952; alpha2 = 0.6437126; alpha3 = 0.6437126; alpha4 = 0.41616768; alpha5 = 1.0; alpha6 = 0.23952095
        
        let gradient6 = CAGradientLayer()
        gradient6.frame = redColor.bounds
        gradient6.colors = [UIColor(hue: CGFloat(alpha1), saturation: CGFloat(alpha2), brightness: CGFloat(alpha3), alpha: 1.0).cgColor, UIColor(hue: CGFloat(alpha4), saturation: CGFloat(alpha5), brightness: CGFloat(alpha6), alpha: 1.0).cgColor]
        gradient6.shouldRasterize = true
        gradient6.startPoint = CGPoint(x: 1, y: 0)
        gradient6.endPoint = CGPoint(x: 0, y: 1)
        greenColor.layer.insertSublayer(gradient6, at: 0)
        greenColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        greenColor.layer.borderWidth = 2

        
        alpha1 = 0.505988; alpha2 = 1.0; alpha3 = 0.5898204; alpha4 = 0.7724551; alpha5 = 1.0; alpha6 = 0.6317365
        
        let gradient7 = CAGradientLayer()
        gradient7.frame = redColor.bounds
        gradient7.colors = [UIColor(hue: CGFloat(alpha1), saturation: CGFloat(alpha2), brightness: CGFloat(alpha3), alpha: 1.0).cgColor, UIColor(hue: CGFloat(alpha4), saturation: CGFloat(alpha5), brightness: CGFloat(alpha6), alpha: 1.0).cgColor]
        gradient7.shouldRasterize = true
        gradient7.startPoint = CGPoint(x: 1, y: 0)
        gradient7.endPoint = CGPoint(x: 0, y: 1)
        yellowColor.layer.insertSublayer(gradient7, at: 0)
        yellowColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        yellowColor.layer.borderWidth = 2
    }
    
    
    
    
    
    

    
    
    
    
    

    

    
    
    
    
    //Opening password pages in Main operations
    
    
    
    
    @IBAction func OpenAccounts(_ sender: UIButton) {
        resetTimer()
        openAccounts()
    }
    
    func openAccounts()
    {
        resetTimer()
        if Menu.isHidden == true
        {
        hideSettings()
        hideAddPass()
        
        view.endEditing(true)
        AccountsView.isHidden = false
        SearchBarAccount.isHidden = false
        AccountsButton.backgroundColor = UIColor.lightGray
            
        
        clearAccountSearchBar()//clears all the search bars when switching between password groups
        clearDeviceSearchBar()
        clearCardSearchBar()
        clearInfoSearchBar()
            
        AccountViewHeight.constant = CGFloat(accountPasswordsY)
        DeviceViewHeight.constant = CGFloat(accountPasswordsY)
        CardViewHeight.constant = CGFloat(accountPasswordsY)
        InfoViewHeight.constant = CGFloat(accountPasswordsY)
            
        
        
        
        DevicesView.isHidden = true
        SearchBarDevice.isHidden = true
        DevicesButton.backgroundColor = UIColor.darkGray
        CardsView.isHidden = true
        SearchBarCard.isHidden = true
        CardsButton.backgroundColor = UIColor.darkGray
        InfoView.isHidden = true
        SearchBarInfo.isHidden = true
        InfoButton.backgroundColor = UIColor.darkGray
        
        if accountPasswordsY > 585
        {
            ScrollView.isScrollEnabled = true
        }
        else
        {
            ScrollView.isScrollEnabled = false
        }
        }
    }
        
    
    
    @IBAction func OpenDevices(_ sender: UIButton) {
        resetTimer()
        openDevices()
        
    }
    
    func openDevices()
    {
        resetTimer()
        if Menu.isHidden == true
        {
        hideSettings()
        hideAddPass()
        
        view.endEditing(true)
        DevicesView.isHidden = false
        SearchBarDevice.isHidden = false
        DevicesButton.backgroundColor = UIColor.lightGray
            
        clearAccountSearchBar()//clears all the search bars when switching between password groups
        clearDeviceSearchBar()
        clearCardSearchBar()
        clearInfoSearchBar()
        
        AccountViewHeight.constant = CGFloat(devicePasswordsY)
        DeviceViewHeight.constant = CGFloat(devicePasswordsY)
        CardViewHeight.constant = CGFloat(devicePasswordsY)
        InfoViewHeight.constant = CGFloat(devicePasswordsY)
        
        
        AccountsView.isHidden = true
        SearchBarAccount.isHidden = true
        AccountsButton.backgroundColor = UIColor.darkGray
        CardsView.isHidden = true
        SearchBarCard.isHidden = true
        CardsButton.backgroundColor = UIColor.darkGray
        InfoView.isHidden = true
        SearchBarInfo.isHidden = true
        InfoButton.backgroundColor = UIColor.darkGray
        
        if devicePasswordsY > 585
        {
            ScrollView.isScrollEnabled = true
        }
        else
        {
            ScrollView.isScrollEnabled = false
        }
        }
    }
    
    @IBAction func OpenCards(_ sender: UIButton) {
        resetTimer()
        openCards()
    }
    
    func openCards()
    {
        resetTimer()
        if Menu.isHidden == true
        {
        hideSettings()
        hideAddPass()
        
        view.endEditing(true)
        CardsView.isHidden = false
        SearchBarCard.isHidden = false
        CardsButton.backgroundColor = UIColor.lightGray
            
        clearAccountSearchBar()//clears all the search bars when switching between password groups
        clearDeviceSearchBar()
        clearCardSearchBar()
        clearInfoSearchBar()
        
        AccountViewHeight.constant = CGFloat(cardPasswordsY)
        DeviceViewHeight.constant = CGFloat(cardPasswordsY)
        CardViewHeight.constant = CGFloat(cardPasswordsY)
        InfoViewHeight.constant = CGFloat(cardPasswordsY)
        
        DevicesView.isHidden = true
        SearchBarDevice.isHidden = true
        DevicesButton.backgroundColor = UIColor.darkGray
        AccountsView.isHidden = true
        SearchBarAccount.isHidden = true
        AccountsButton.backgroundColor = UIColor.darkGray
        InfoView.isHidden = true
        SearchBarInfo.isHidden = true
        InfoButton.backgroundColor = UIColor.darkGray
            
        
        
        if cardPasswordsY > 585
        {
            ScrollView.isScrollEnabled = true
        }
        else
        {
            ScrollView.isScrollEnabled = false
        }
        }
    }
    
    @IBAction func OpenInfo(_ sender: UIButton) {
        resetTimer()
        openInfo()
        
    }
    
    func openInfo()
    {
        resetTimer()
        if Menu.isHidden == true
        {
        hideSettings()
        hideAddPass()
        
        view.endEditing(true)
        InfoView.isHidden = false
        SearchBarInfo.isHidden = false
        InfoButton.backgroundColor = UIColor.lightGray
            
        clearAccountSearchBar()//clears all the search bars when switching between password groups
        clearDeviceSearchBar()
        clearCardSearchBar()
        clearInfoSearchBar()
        
        AccountViewHeight.constant = CGFloat(infoPasswordsY)
        DeviceViewHeight.constant = CGFloat(infoPasswordsY)
        CardViewHeight.constant = CGFloat(infoPasswordsY)
        InfoViewHeight.constant = CGFloat(infoPasswordsY)
        
        DevicesView.isHidden = true
        SearchBarDevice.isHidden = true
        DevicesButton.backgroundColor = UIColor.darkGray
        AccountsView.isHidden = true
        SearchBarAccount.isHidden = true
        AccountsButton.backgroundColor = UIColor.darkGray
        CardsView.isHidden = true
        SearchBarCard.isHidden = true
        CardsButton.backgroundColor = UIColor.darkGray
        
        if infoPasswordsY > 585
        {
            ScrollView.isScrollEnabled = true
        }
        else
        {
            ScrollView.isScrollEnabled = false
        }
        }
    }
    

    
    
    
    
    //Search Filter Operations
    
    
    
    @IBAction func AccountFilter(_ sender: UITextField) {
        print(AccountSearchBar.text!)
        hideSettings()
        hideAddPass()
        resetTimer()
        if AccountButtonIdentifiers.count > 0
        {
        accountPasswordsY = 2
        
        for key in 0...AccountButtonIdentifiers.count - 1
        {
            var button: UIButton = AccountButtonIdentifiers[key]!
            button.frame = CGRect(x: 0, y: CGFloat(accountPasswordsY), width: self.AccountsView.frame.width, height: 50)
            AccountButtonIdentifiers[key]!.isHidden = true
            
            accountPasswordsY += 52
            
        }
        
        accountPasswordsY = 2
        
        for key in 0...AccountButtonIdentifiers.count - 1
        {
            var button: UIButton = AccountButtonIdentifiers[key]!
            
            if button.accessibilityIdentifier!.contains(AccountSearchBar.text!)
            {
                button.frame = CGRect(x: 0, y: CGFloat(accountPasswordsY), width: self.AccountsView.frame.width, height: 50)
                button.isHidden = false
                accountPasswordsY += 52
            }
            
        }
        
        
        if AccountSearchBar.text! == ""
        {
            accountPasswordsY = 2
            for key in 0...AccountButtonIdentifiers.count - 1
            {
                var button: UIButton = AccountButtonIdentifiers[key]!
                
                button.frame = CGRect(x: 0, y: CGFloat(accountPasswordsY), width: self.AccountsView.frame.width, height: 50)
                button.isHidden = false
                accountPasswordsY += 52
                
            }
        }
            
        if accountPasswordsY > 585
        {
            ScrollView.isScrollEnabled = true
        }
        else
        {
            ScrollView.isScrollEnabled = false
        }
            
        AccountViewHeight.constant = CGFloat(accountPasswordsY)
        DeviceViewHeight.constant = CGFloat(accountPasswordsY)
        CardViewHeight.constant = CGFloat(accountPasswordsY)
        InfoViewHeight.constant = CGFloat(accountPasswordsY)
            
        }
        
    }
    
    
    
    
    
    
    
    @IBAction func DeviceFilter(_ sender: UITextField) {
        print(DeviceSearchBar.text!)
        hideSettings()
        hideAddPass()
        resetTimer()
        if DeviceButtonIdentifiers.count > 0
        {
        devicePasswordsY = 2
        
        for key in 0...DeviceButtonIdentifiers.count - 1
        {
            var button: UIButton = DeviceButtonIdentifiers[key]!
            button.frame = CGRect(x: 0, y: CGFloat(devicePasswordsY), width: self.DevicesView.frame.width, height: 50)
            DeviceButtonIdentifiers[key]!.isHidden = true
            
            devicePasswordsY += 52
            
        }
        
        devicePasswordsY = 2
        
        for key in 0...DeviceButtonIdentifiers.count - 1
        {
            var button: UIButton = DeviceButtonIdentifiers[key]!
            
            if button.accessibilityIdentifier!.contains(DeviceSearchBar.text!)
            {
                button.frame = CGRect(x: 0, y: CGFloat(devicePasswordsY), width: self.DevicesView.frame.width, height: 50)
                button.isHidden = false
                devicePasswordsY += 52
            }
            
        }
            
        
        if DeviceSearchBar.text! == ""
        {
            devicePasswordsY = 2
            for key in 0...DeviceButtonIdentifiers.count - 1
            {
                var button: UIButton = DeviceButtonIdentifiers[key]!
                
                button.frame = CGRect(x: 0, y: CGFloat(devicePasswordsY), width: self.DevicesView.frame.width, height: 50)
                button.isHidden = false
                devicePasswordsY += 52
                
            }
        }
            
            
        if devicePasswordsY > 585
        {
            ScrollView.isScrollEnabled = true
        }
        else
        {
            ScrollView.isScrollEnabled = false
        }
            
        AccountViewHeight.constant = CGFloat(devicePasswordsY)
        DeviceViewHeight.constant = CGFloat(devicePasswordsY)
        CardViewHeight.constant = CGFloat(devicePasswordsY)
        InfoViewHeight.constant = CGFloat(devicePasswordsY)
        
            
        }
        
    }
    
    
    
    
    
    
    
    @IBAction func CardFilter(_ sender: UITextField) {
        print(CardSearchBar.text!)
        hideSettings()
        hideAddPass()
        resetTimer()
        if CardButtonIdentifiers.count > 0
        {
        cardPasswordsY = 2
        
        for key in 0...CardButtonIdentifiers.count - 1
        {
            var button: UIButton = CardButtonIdentifiers[key]!
            button.frame = CGRect(x: 0, y: CGFloat(cardPasswordsY), width: self.CardsView.frame.width, height: 50)
            CardButtonIdentifiers[key]!.isHidden = true
            
            cardPasswordsY += 52
            
        }
        
        cardPasswordsY = 2
        
        for key in 0...CardButtonIdentifiers.count - 1
        {
            var button: UIButton = CardButtonIdentifiers[key]!
            
            if button.accessibilityIdentifier!.contains(CardSearchBar.text!)
            {
                button.frame = CGRect(x: 0, y: CGFloat(cardPasswordsY), width: self.CardsView.frame.width, height: 50)
                button.isHidden = false
                cardPasswordsY += 52
            }
            
        }
        
        
        if CardSearchBar.text! == ""
        {
            cardPasswordsY = 2
            for key in 0...CardButtonIdentifiers.count - 1
            {
                var button: UIButton = CardButtonIdentifiers[key]!
                
                button.frame = CGRect(x: 0, y: CGFloat(cardPasswordsY), width: self.CardsView.frame.width, height: 50)
                button.isHidden = false
                cardPasswordsY += 52
                
            }
        }
            
            
            
        if cardPasswordsY > 585
        {
            ScrollView.isScrollEnabled = true
        }
        else
        {
            ScrollView.isScrollEnabled = false
        }
            
        AccountViewHeight.constant = CGFloat(cardPasswordsY)
        DeviceViewHeight.constant = CGFloat(cardPasswordsY)
        CardViewHeight.constant = CGFloat(cardPasswordsY)
        InfoViewHeight.constant = CGFloat(cardPasswordsY)
            
        }
        
    }
    

    
    
    
    @IBAction func InfoFilter(_ sender: UITextField) {
        print(InfoSearchBar.text!)
        hideSettings()
        hideAddPass()
        resetTimer()
        if InfoButtonIdentifiers.count > 0
        {
        infoPasswordsY = 2
        
        for key in 0...InfoButtonIdentifiers.count - 1
        {
            var button: UIButton = InfoButtonIdentifiers[key]!
            button.frame = CGRect(x: 0, y: CGFloat(infoPasswordsY), width: self.InfoView.frame.width, height: 50)
            InfoButtonIdentifiers[key]!.isHidden = true
            
            infoPasswordsY += 52
            
        }
        
        infoPasswordsY = 2
        
        for key in 0...InfoButtonIdentifiers.count - 1
        {
            var button: UIButton = InfoButtonIdentifiers[key]!
            
            if button.accessibilityIdentifier!.contains(InfoSearchBar.text!)
            {
                button.frame = CGRect(x: 0, y: CGFloat(infoPasswordsY), width: self.InfoView.frame.width, height: 50)
                button.isHidden = false
                infoPasswordsY += 52
            }
            
        }
        
        
        if InfoSearchBar.text! == ""
        {
            infoPasswordsY = 2
            for key in 0...InfoButtonIdentifiers.count - 1
            {
                var button: UIButton = InfoButtonIdentifiers[key]!
                
                button.frame = CGRect(x: 0, y: CGFloat(infoPasswordsY), width: self.InfoView.frame.width, height: 50)
                button.isHidden = false
                infoPasswordsY += 52
                
            }
        }
            
        if infoPasswordsY > 585
        {
            ScrollView.isScrollEnabled = true
        }
        else
        {
            ScrollView.isScrollEnabled = false
        }
            
        AccountViewHeight.constant = CGFloat(infoPasswordsY)
        DeviceViewHeight.constant = CGFloat(infoPasswordsY)
        CardViewHeight.constant = CGFloat(infoPasswordsY)
        InfoViewHeight.constant = CGFloat(infoPasswordsY)
        
        }
        
    }
    
    
    
    
    
    
    
    
    //Clear Search Operations
    
    
    
    
    @IBAction func ClearAccountSearch(_ sender: UIButton) {
        clearAccountSearchBar()
    }
    
    func clearAccountSearchBar(){
        AccountSearchBar.text = ""
        resetTimer()
        if AccountButtonIdentifiers.count > 0
        {
        accountPasswordsY = 2
        
        if AccountSearchBar.text! == ""
        {
            for key in 0...AccountButtonIdentifiers.count - 1
            {
                var button: UIButton = AccountButtonIdentifiers[key]!
                
                button.frame = CGRect(x: 0, y: CGFloat(accountPasswordsY), width: self.AccountsView.frame.width, height: 50)
                button.isHidden = false
                accountPasswordsY += 52
                
            }
        }
            if accountPasswordsY > 585
            {
                ScrollView.isScrollEnabled = true
            }
            else
            {
                ScrollView.isScrollEnabled = false
            }
                
            AccountViewHeight.constant = CGFloat(accountPasswordsY)
            DeviceViewHeight.constant = CGFloat(accountPasswordsY)
            CardViewHeight.constant = CGFloat(accountPasswordsY)
            InfoViewHeight.constant = CGFloat(accountPasswordsY)
            
            
        }
    }
    
    
    
    
    @IBAction func ClearDeviceSearch(_ sender: UIButton) {
        clearDeviceSearchBar()
    }
    
    func clearDeviceSearchBar(){
        DeviceSearchBar.text = ""
        resetTimer()
        if DeviceButtonIdentifiers.count > 0
        {
        devicePasswordsY = 2
        
        if DeviceSearchBar.text! == ""
        {
            for key in 0...DeviceButtonIdentifiers.count - 1
            {
                var button: UIButton = DeviceButtonIdentifiers[key]!
                
                button.frame = CGRect(x: 0, y: CGFloat(devicePasswordsY), width: self.DevicesView.frame.width, height: 50)
                button.isHidden = false
                devicePasswordsY += 52
                
            }
        }
            
        if devicePasswordsY > 585
        {
            ScrollView.isScrollEnabled = true
        }
        else
        {
            ScrollView.isScrollEnabled = false
        }
            
        AccountViewHeight.constant = CGFloat(devicePasswordsY)
        DeviceViewHeight.constant = CGFloat(devicePasswordsY)
        CardViewHeight.constant = CGFloat(devicePasswordsY)
        InfoViewHeight.constant = CGFloat(devicePasswordsY)
            
        }
    }
    
    
    
    
    @IBAction func ClearCardSearch(_ sender: UIButton) {
        clearCardSearchBar()
    }
    
    func clearCardSearchBar(){
        CardSearchBar.text = ""
        resetTimer()
        if CardButtonIdentifiers.count > 0
        {
        cardPasswordsY = 2
        
        if CardSearchBar.text! == ""
        {
            for key in 0...CardButtonIdentifiers.count - 1
            {
                var button: UIButton = CardButtonIdentifiers[key]!
                
                button.frame = CGRect(x: 0, y: CGFloat(cardPasswordsY), width: self.CardsView.frame.width, height: 50)
                button.isHidden = false
                cardPasswordsY += 52
                
            }
        }
            
        if cardPasswordsY > 585
        {
            ScrollView.isScrollEnabled = true
        }
        else
        {
            ScrollView.isScrollEnabled = false
        }
            
        AccountViewHeight.constant = CGFloat(cardPasswordsY)
        DeviceViewHeight.constant = CGFloat(cardPasswordsY)
        CardViewHeight.constant = CGFloat(cardPasswordsY)
        InfoViewHeight.constant = CGFloat(cardPasswordsY)
            
        }
    }
    
    
    
    @IBAction func ClearInfoSearch(_ sender: UIButton) {
        clearInfoSearchBar()
    }
    
    
    func clearInfoSearchBar(){
        InfoSearchBar.text = ""
        resetTimer()
        if InfoButtonIdentifiers.count > 0
        {
        infoPasswordsY = 2
        
        if InfoSearchBar.text! == ""
        {
            for key in 0...InfoButtonIdentifiers.count - 1
            {
                var button: UIButton = InfoButtonIdentifiers[key]!
                
                button.frame = CGRect(x: 0, y: CGFloat(infoPasswordsY), width: self.InfoView.frame.width, height: 50)
                button.isHidden = false
                infoPasswordsY += 52
                
            }
        }
            
        if infoPasswordsY > 585
        {
            ScrollView.isScrollEnabled = true
        }
        else
        {
            ScrollView.isScrollEnabled = false
        }
            
        AccountViewHeight.constant = CGFloat(infoPasswordsY)
        DeviceViewHeight.constant = CGFloat(infoPasswordsY)
        CardViewHeight.constant = CGFloat(infoPasswordsY)
        InfoViewHeight.constant = CGFloat(infoPasswordsY)
             
        }
    }
    
    
    
    
    
    
    @IBAction func toNewAccount(_ sender: UIButton) {
        newAccount = true
        performSegue(withIdentifier: "MainToNewAccount", sender: self)
    }
    
    @IBAction func toNewDevice(_ sender: UIButton) {
        newDevice = true
        performSegue(withIdentifier: "MainToNewDevice", sender: self)
    }
    
    @IBAction func toNewCard(_ sender: UIButton) {
        newCard = true
        performSegue(withIdentifier: "MainToNewCard", sender: self)
    }
    
    @IBAction func toNewInfo(_ sender: UIButton) {
        newInfo = true
        performSegue(withIdentifier: "MainToNewInfo", sender: self)
    }
    
    
    
    
    @objc func OpenAccountPassword(sender: UIButton!) {
        if Menu.isHidden == true && NewPasswordMenu.isHidden == true
        {
            view.endEditing(true)
            passIdentifier = AccountIdentifiers[sender.tag]!
            viewAccount = true
            performSegue(withIdentifier: "MainToAccountPass", sender: self)
        }
        else if Menu.isHidden == false
        {
            hideSettings()
        }
        else if NewPasswordMenu.isHidden == false
        {
            hideAddPass()
        }
    }
    
    @objc func OpenDevicePassword(sender: UIButton!) {
        if Menu.isHidden == true
        {
            view.endEditing(true)
            passIdentifier = DeviceIdentifiers[sender.tag]!
            viewDevice = true
            performSegue(withIdentifier: "MainToDevicePass", sender: self)
        }
        else
        {
            hideSettings()
        }
    }
    
    @objc func OpenCardPassword(sender: UIButton!) {
        if Menu.isHidden == true
        {
            view.endEditing(true)
            passIdentifier = CardIdentifiers[sender.tag]!
            viewCard = true
            performSegue(withIdentifier: "MainToCardPass", sender: self)
        }
        else
        {
            hideSettings()
        }
    }
    
    @objc func OpenInfoPassword(sender: UIButton!) {
        if Menu.isHidden == true
        {
            view.endEditing(true)
            passIdentifier = InfoIdentifiers[sender.tag]!
            
            DecryptingLabel.isHidden = false
            DecryptingActivityIndicator.startAnimating()
            print("start")
            infoPassword = adjustedDecrypt(userInfoPasswords[username]![passIdentifier]!, decryption1(ciphers[username]!))
            print("end")
            DecryptingLabel.isHidden = true
            DecryptingActivityIndicator.stopAnimating()
            
            viewInfo = true
            performSegue(withIdentifier: "MainToInfoPass", sender: self)
        }
        else
        {
            hideSettings()
        }
    }
    

    
    
    
    @IBAction func OpenUsernameChange(_ sender: UIButton) {
        usernameChange = true
        passwordChange = false
        accountDelete = false
        performSegue(withIdentifier: "MainToAccountEdit", sender: self)
    }
    
    
    @IBAction func OpenPasswordReset(_ sender: UIButton) {
        passwordChange = true
        usernameChange = false
        accountDelete = false
        performSegue(withIdentifier: "MainToAccountEdit", sender: self)
    }
    
    @IBAction func OpenAccountDelete(_ sender: UIButton) {
        accountDelete = true
        usernameChange = false
        passwordChange = false
        performSegue(withIdentifier: "MainToAccountEdit", sender: self)
    }
    
    
    
    
    
    
    
    
    @objc func OpenAccountPassOptions(sender: UIButton!, event: UIEvent!)
    {
        resetTimer()
        var button = AccountButtonIdentifiers[sender.tag]!

        if button.frame.origin.x == 0 && swiped == false
        {
            UIView.animate(withDuration: 0.4, animations: {button.frame.origin.x = -100}, completion: nil)
            swiped = true
        }
        else if button.frame.origin.x == -100  && swiped == true
        {
             UIView.animate(withDuration: 0.4, animations: {button.frame.origin.x = 0}, completion: nil)
            swiped = false

        }
    }
    
    
    
    
    //    Old Color Code can be found in Color Changer Code
    
    
    //set new Background Color operations
    
    @IBAction func setRed(_ sender: UIButton) {
        resetTimer()
        
        redColor.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        redColor.layer.borderWidth = 2
        
        blueColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        blueColor.layer.borderWidth = 2
        purpleColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        purpleColor.layer.borderWidth = 2
        orangeColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        orangeColor.layer.borderWidth = 2
        greenColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        greenColor.layer.borderWidth = 2
        yellowColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        yellowColor.layer.borderWidth = 2
        
        alpha1 = 1.0; alpha2 = 1.0; alpha3 = 0.76047903; alpha4 = 0.0; alpha5 = 1.0; alpha6 = 0.26047903
    }
    
    @IBAction func setBlue(_ sender: UIButton) {
        resetTimer()
        
        blueColor.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        blueColor.layer.borderWidth = 2
        
        redColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        redColor.layer.borderWidth = 2
        purpleColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        purpleColor.layer.borderWidth = 2
        orangeColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        orangeColor.layer.borderWidth = 2
        greenColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        greenColor.layer.borderWidth = 2
        yellowColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        yellowColor.layer.borderWidth = 2
        
        alpha1 = 0.6317365; alpha2 = 0.7305389; alpha3 = 1.0; alpha4 = 0.65868264; alpha5 = 1.0; alpha6 = 0.14670658
    }
    
    @IBAction func setPurple(_ sender: UIButton) {
        resetTimer()
        
        purpleColor.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        purpleColor.layer.borderWidth = 2
        
        blueColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        blueColor.layer.borderWidth = 2
        redColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        redColor.layer.borderWidth = 2
        orangeColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        orangeColor.layer.borderWidth = 2
        greenColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        greenColor.layer.borderWidth = 2
        yellowColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        yellowColor.layer.borderWidth = 2
        
        alpha1 = 0.8293413; alpha2 = 1.0; alpha3 = 0.38622755; alpha4 = 0.66467065; alpha5 = 0.7994012; alpha6 = 0.31437126
    }
    
    @IBAction func setOrange(_ sender: UIButton) {
        resetTimer()
        
        orangeColor.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        orangeColor.layer.borderWidth = 2
        
        blueColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        blueColor.layer.borderWidth = 2
        purpleColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        purpleColor.layer.borderWidth = 2
        redColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        redColor.layer.borderWidth = 2
        greenColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        greenColor.layer.borderWidth = 2
        yellowColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        yellowColor.layer.borderWidth = 2
        
        alpha1 = 0.056886226; alpha2 = 1.0; alpha3 = 0.8203593; alpha4 = 1.0; alpha5 = 1.0; alpha6 = 0.24550898
    }
    
    @IBAction func setGreen(_ sender: UIButton) {
        resetTimer()
        
        greenColor.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        greenColor.layer.borderWidth = 2
        
        blueColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        blueColor.layer.borderWidth = 2
        purpleColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        purpleColor.layer.borderWidth = 2
        orangeColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        orangeColor.layer.borderWidth = 2
        redColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        redColor.layer.borderWidth = 2
        yellowColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        yellowColor.layer.borderWidth = 2
        
        alpha1 = 0.3023952; alpha2 = 0.6437126; alpha3 = 0.6437126; alpha4 = 0.41616768; alpha5 = 1.0; alpha6 = 0.23952095

    }
    
    @IBAction func setYellow(_ sender: UIButton) {
        resetTimer()
        
        yellowColor.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        yellowColor.layer.borderWidth = 2
        
        blueColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        blueColor.layer.borderWidth = 2
        purpleColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        purpleColor.layer.borderWidth = 2
        orangeColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        orangeColor.layer.borderWidth = 2
        greenColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        greenColor.layer.borderWidth = 2
        redColor.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        redColor.layer.borderWidth = 2
        
        alpha1 = 0.505988; alpha2 = 1.0; alpha3 = 0.5898204; alpha4 = 0.7724551; alpha5 = 1.0; alpha6 = 0.6317365
    }
    
    
    
    
    
    
    @IBAction func SetBackground(_ sender: UIButton) {
        
        resetTimer()
        
        color1 = UIColor(hue: CGFloat(alpha1), saturation: CGFloat(alpha2), brightness: CGFloat(alpha3), alpha: 1.0)
        color2 = UIColor(hue: CGFloat(alpha4), saturation: CGFloat(alpha5), brightness: CGFloat(alpha6), alpha: 1.0)
        
        gradient.frame = view.bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        gradient.shouldRasterize = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0.7)
        view.layer.insertSublayer(gradient, at: 0)
        
        
        gradient3.frame = MenuLabelBackground.bounds
        gradient3.colors = [color1.cgColor,color2.cgColor]
        gradient3.shouldRasterize = true
        gradient3.startPoint = CGPoint(x: 0, y: 1)
        gradient3.endPoint = CGPoint(x: 1, y: 0)
        MenuLabelBackground.layer.insertSublayer(gradient3, at: 0)
        
        
        
        
        accountSearchGradient.frame = FullAccountSearchBar.bounds
        accountSearchGradient.colors = [color1.cgColor,color2.cgColor]
        accountSearchGradient.shouldRasterize = true
        accountSearchGradient.startPoint = CGPoint(x: 0, y: 1)
        accountSearchGradient.endPoint = CGPoint(x: 1, y: 0)
        FullAccountSearchBar.layer.insertSublayer(accountSearchGradient, at: 0)
        
        
        deviceSearchGradient.frame = FullDeviceSearchBar.bounds
        deviceSearchGradient.colors = [color1.cgColor,color2.cgColor]
        deviceSearchGradient.shouldRasterize = true
        deviceSearchGradient.startPoint = CGPoint(x: 0, y: 1)
        deviceSearchGradient.endPoint = CGPoint(x: 1, y: 0)
        FullDeviceSearchBar.layer.insertSublayer(deviceSearchGradient, at: 0)
        
        
        cardSearchGradient.frame = FullCardSearchBar.bounds
        cardSearchGradient.colors = [color1.cgColor,color2.cgColor]
        cardSearchGradient.shouldRasterize = true
        cardSearchGradient.startPoint = CGPoint(x: 0, y: 1)
        cardSearchGradient.endPoint = CGPoint(x: 1, y: 0)
        FullCardSearchBar.layer.insertSublayer(cardSearchGradient, at: 0)
        
        infoSearchGradient.frame = FullInfoSearchBar.bounds
        infoSearchGradient.colors = [color1.cgColor,color2.cgColor]
        infoSearchGradient.shouldRasterize = true
        infoSearchGradient.startPoint = CGPoint(x: 0, y: 1)
        infoSearchGradient.endPoint = CGPoint(x: 1, y: 0)
        FullInfoSearchBar.layer.insertSublayer(infoSearchGradient, at: 0)
        

        
        
        UserDefaults.standard.set(alpha1, forKey: "alpha1")
        UserDefaults.standard.set(alpha2, forKey: "alpha2")
        UserDefaults.standard.set(alpha3, forKey: "alpha3")
        UserDefaults.standard.set(alpha4, forKey: "alpha4")
        UserDefaults.standard.set(alpha5, forKey: "alpha5")
        UserDefaults.standard.set(alpha6, forKey: "alpha6")
        
    }
    
    
    
    
    
    
    
    
    //Various Random Operations
    
    
    @IBAction func AddPassword(_ sender: UIButton) {
        
        hideSettings()
        resetTimer()
        view.endEditing(true)
        if addTapped == false
        {
            
            NewPasswordMenu.isHidden = false
            NewPasswordMenu.alpha = 0.0
            
            UIView.animate(withDuration: 1) {self.AddButton.transform = CGAffineTransform(rotationAngle: .pi); self.AddButton.transform = CGAffineTransform(rotationAngle: .pi * 2); self.AddButton.tintColor = UIColor(named: "color2")}
            
            UIView.animate(withDuration: 1, animations: {self.NewPasswordMenu.frame.origin.y += 38})
            UIView.animate(withDuration: 1, animations: {self.NewPasswordMenu.transform = CGAffineTransform(scaleX: 1, y: 1); self.NewPasswordMenu.alpha = 1})
            
            addTapped = true
        }
        else
        {
            hideAddPass()
        }
    }
    
    
    
    
    @IBAction func SignOut(_ sender: UIButton) {
        
        signOut = true
        timer.invalidate()
        view.endEditing(true)
        performSegue(withIdentifier: "MainToStart", sender: self)
    }
    
    
    
    
    @IBAction func OpenSettings(_ sender: UIButton) {
        
        hideAddPass()
        resetTimer()
        view.endEditing(true)
        if settingsTapped == false && settingsCloseCompleted == true
        {
            settingsOpenCompleted = false
            
            Menu.isHidden = false
            Menu.alpha = 0.0
            
            UIView.animate(withDuration: 1) {self.SettingsButton.tintColor = UIColor(named: "color2")}
            UIView.animate(withDuration: 1, animations: {self.Menu.transform = CGAffineTransform(scaleX: 1, y: 1); self.Menu.alpha = 1}, completion: {finised in self.settingsOpenCompleted = true})
            
            settingsTapped = true
            
        }
        else if settingsTapped == true && settingsOpenCompleted == true
        {
            settingsCloseCompleted = false
            hideSettings()
        }
    }
    
    
    func hideAddPass()
    {
        resetTimer()
        if NewPasswordMenu.isHidden == false
        {
            UIView.animate(withDuration: 1) {self.AddButton.transform = CGAffineTransform(rotationAngle: .pi); self.AddButton.transform = CGAffineTransform(rotationAngle: .pi * 2); self.AddButton.tintColor = UIColor(named: "color0")}
            

            UIView.animate(withDuration: 1, animations: {self.NewPasswordMenu.frame.origin.y -= 38})
            UIView.animate(withDuration: 1, animations: {self.NewPasswordMenu.transform = CGAffineTransform(scaleX: 0.01, y: 0.01); self.NewPasswordMenu.alpha = 0.0}, completion: {finished in self.NewPasswordMenu.isHidden = true})
        
            addTapped = false
        }
    }
    
    
    
    func hideSettings()
    {
        resetTimer()
        if Menu.isHidden == false
        {
        UIView.animate(withDuration: 1) {self.SettingsButton.tintColor = UIColor(named: "color0")}

        UIView.animate(withDuration: 1, animations: {self.Menu.transform = CGAffineTransform(scaleX: 0.01, y: 0.01); self.Menu.alpha = 0.0}, completion: {finished in self.Menu.isHidden = true; self.settingsCloseCompleted = true})
        
        settingsTapped = false
        }
    }
    
    
    @objc func Welcome()
    {
        AddButton.isHidden = false
        AddButton.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.7, animations: {self.WelcomeLabel.alpha = 0.0; self.AddButton.transform = CGAffineTransform(scaleX: 1, y: 1)}, completion: {finished in self.WelcomeLabel.isHidden = true;})
        
    }
    
    @IBAction func TapGesture(_ sender: UITapGestureRecognizer) {
        resetTimer()
        hideSettings()
        hideAddPass()
        view.endEditing(true)
    }
    
    
    @objc func scrolling()
    {
        resetTimer()
    }
    
    
    
    
    @IBAction func SwipeRight(_ sender: UISwipeGestureRecognizer) {
        
        resetTimer()
        if AccountsView.isHidden == false
        {
            openDevices()
        }
        else if DevicesView.isHidden == false
        {
            openCards()
        }
        else if CardsView.isHidden == false
        {
            openInfo()
        }
        
    }
    
    
    @IBAction func SwipeLeft(_ sender: UISwipeGestureRecognizer) {
        
        resetTimer()
        if DevicesView.isHidden == false
        {
            openAccounts()
        }
        else if CardsView.isHidden == false
        {
            openDevices()
        }
        else if InfoView.isHidden == false
        {
            openCards()
        }
    }
    
    
    
    
    
    
    func resetTimer()
    {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(SignOut), userInfo: nil, repeats: false)
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
