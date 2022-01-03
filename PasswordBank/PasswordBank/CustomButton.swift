//
//  CustomButton.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 8/13/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import UIKit


class CustomButton: UIButton
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder decoder: NSCoder)
    {
        super.init(coder: decoder)
        setUpButton()
    }
    
    func setUpButton() {
        setTitleColor(.black, for: .normal)
        layer.frame.size = CGSize(width: 10, height: 10)
        backgroundColor      = UIColor.yellow
        layer.cornerRadius   = 30
        layer.borderWidth    = 1.0
        layer.borderColor    = UIColor.darkGray.cgColor
    }
    
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    
    func shake() {
        let shake           = CABasicAnimation(keyPath: "position")
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true
        
        let fromPoint       = CGPoint(x: center.x - 8, y: center.y)
        let fromValue       = NSValue(cgPoint: fromPoint)
        
        let toPoint         = CGPoint(x: center.x + 8, y: center.y)
        let toValue         = NSValue(cgPoint: toPoint)
        
        shake.fromValue     = fromValue
        shake.toValue       = toValue
        
        layer.add(shake, forKey: "position")
    }
    
}
