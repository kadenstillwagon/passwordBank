//
//  DeFunctions.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 12/29/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import Foundation


func decrypt(_ encryptedPassword: String, _ cipher: String) -> String
{
    var decryptedPassword = ""
    
//    print(encryptedPassword)
    var decryptedL1 = decryption1(encryptedPassword)
//    print("Decryption 1: " + decryptedL1)
    var decryptedL2 = decryption2(cipher, decryptedL1)
//    print("Decryption 2: " + decryptedL2)
    var decryptedL3 = decryption3(cipher, decryptedL2)
//    print("Decryption 3: " + decryptedL3)
    var decryptedL4 = decryption4(cipher, decryptedL3)
//    print("Decryption 4: " + decryptedL4)
    var decryptedL5 = decryption5(cipher, decryptedL4)
//    print("Decryption 5: " + decryptedL5)
    
    decryptedPassword = decryptedL5
    
    
    return decryptedPassword
}


func adjustedDecrypt(_ encryptedPassword: String, _ cipher: String) -> String
{
    
    var decryptedPassword = ""
    
//    print(encryptedPassword)
    var decryptedL1 = decryption1(encryptedPassword)
//    print("Decryption 1: " + decryptedL1)
    var decryptedL2 = decryption4(cipher, decryptedL1)
//    print("Decryption 2: " + decryptedL2)
    var decryptedL3 = decryption5(cipher, decryptedL2)
//    print("Decryption 3: " + decryptedL3)
    
    decryptedPassword = decryptedL3
    
    
    return decryptedPassword
}



func decryption1(_ jumbledInput: String) -> String
{
    var L1Decrypted = ""
    var jumbledArray = ["a"]
    jumbledArray.popLast()
    var cleaned = ["a"]
    cleaned.popLast()
    for character in jumbledInput
    {
        jumbledArray.append(String(character))
    }
    var Count = 0
    var count = 0
    var ccount = 0
    cleaned = jumbledArray
    for entity in jumbledArray
    {
        ccount += 1
        if ccount%2 == 1
        {
            Count += 1
            var index = cleaned.count - Count
            cleaned[index] = entity
        }
        else
        {
            count += 1
            var index = count - 1
            cleaned[index] = entity
        }
    }
    for entity in cleaned
    {
        L1Decrypted += entity
    }
    
    return L1Decrypted
}

private func decryption2(_ cipher: String, _ decryptedL1: String) -> String
{
    var L1Decrypted = decryptedL1
    var L1DECRYPTED = decryptedL1
    var L2Decrypted = ""
    var dictionary = createDictionary(cipher)
    var Count = 0
    var count = 0
    var numbers = ""
    var Numbers = ""
    var new = ""
    for character in L1Decrypted
    {
        Count += 1
        L1DECRYPTED = String(L1DECRYPTED.suffix(L1DECRYPTED.count - 1))
        if L1Decrypted.count == L1DECRYPTED.count + 1
        {
            count += 1
            if character != "»"
            {
                var failed = false
                L1Decrypted = String(L1Decrypted.suffix(L1Decrypted.count - 1))
                var index = L1Decrypted.firstIndex(of: ")")
                var Index = L1Decrypted.distance(from: L1Decrypted.startIndex, to: index!) + 1
                var identifier = String(L1Decrypted.prefix(Index))
                L1Decrypted = String(L1Decrypted.suffix(L1Decrypted.count - Index))
                
                identifier.remove(at: identifier.index(of: "(")!)
                identifier.remove(at: identifier.index(of: ")")!)
                var Identifier = Int(identifier)!
                
                var number = dictionary.get(String(character))
                number = number + (144 * Identifier)
                number = number - 3
                
                if number % count != 0
                {
                    failed = true
                    print("Failed: " + String(count) + " " + String(number))
                }
                number = number / count
                if failed == true
                {
                    print(character)
                    print(dictionary.get(number))
                }
                
                
                L2Decrypted += dictionary.get(number)
            }
            else
            {
                L1Decrypted = String(L1Decrypted.suffix(L1Decrypted.count - 1))
                
                L2Decrypted += "»"
            }
        }
        
    }
    
    L2Decrypted += "»"
    
    return L2Decrypted
}



func decryption3(_ cipher: String, _ decryptedL2: String) -> String
{
    var L2Decrypted = decryptedL2
    var L3decrypted = ""
    var dictionary = createDictionary(cipher)
    var count = 0
    var Previous = false
    for character in decryptedL2
    {
        if character == "»" && Previous == false
        {
            Previous = true
            var index = L2Decrypted.firstIndex(of: character)
            var Index = L2Decrypted.distance(from: L2Decrypted.startIndex, to: index!)
            var HEX = String(L2Decrypted.prefix(Index))
            L2Decrypted = String(L2Decrypted.suffix(L2Decrypted.count - (Index + 1)))
            
            if count > 429
            {
                count = count - 429
            }
            
            var number = unHex(HEX)
            number = number/primes[count]
            number = number - 1
            L3decrypted += dictionary.get(number)
            count += 1
            
        }
        else if character == "»" && Previous == true
        {
            L3decrypted += "»"
            L2Decrypted = String(L2Decrypted.suffix(L2Decrypted.count - 1))
            Previous = false
        }
        else
        {
            Previous = false
        }
        
    }
    
    return L3decrypted
}

func decryption4(_ cipher: String, _ decryptedL3: String) -> String
{
    var L3Decrypted = decryptedL3
    var L4decrypted = ""
    var dictionary = createDictionary(cipher)
    var count = 0
    for character in decryptedL3
    {
        if character == "»"
        {
            count += 1
            var index = L3Decrypted.firstIndex(of: character)
            var Index = L3Decrypted.distance(from: L3Decrypted.startIndex, to: index!)
            var HEX = String(L3Decrypted.prefix(Index))
            L3Decrypted = String(L3Decrypted.suffix(L3Decrypted.count - (Index + 1)))
            
            var number = unHex(HEX)
            
            
            if count%4 == 0
            {
                if count < 300
                {
                    number = number - (count * 6)
                    number = number - Int(pow(Double(count), 2))
                }
                number = number - 17
            }
            
            
            if count%3 == 0
            {
                if count < 30
                {
                    number = number - Int(pow(Double(count), Double(count/3)))
                }
                number = number / 441
            }
            
            
            if count%2 == 0
            {
                if count < 300
                {
                    number = number/count
                }
                number = number - 31
                
                var value = Double(pow(Double(number), (1/6))).rounded()
                number = Int(value)
                
            }
            
            number = number - 1
            
            
            L4decrypted += dictionary.get(number)
            
        }
        
    }
    
    return L4decrypted
}


func decryption5(_ cipher: String, _ decryptedL4: String) -> String
{
    var L5decrypted = ""
    var dictionary = createDictionary(cipher)
    var count = 0
    var add = 0
    for character in decryptedL4
    {
        count += 1
        
        var number = dictionary.get(String(character))
        
        number += 142
        
        if count%2 == 0
        {
            add = 1
        }
        else
        {
            add = 2
        }
        if count%3 == 1
        {
            add += 1
        }
        
        number = number - add
        
        if number > 142
        {
            number = number - 142
        }
        
        L5decrypted += dictionary.get(number)
        
    
    
    }
    
    return L5decrypted
}



func unHex(_ hexed: String) -> Int
{
    var unHexed = 0
    var count = 0
    for character  in hexed
    {
        var multiplier = Int(character.asciiValue! - 33)
        unHexed += Int(multiplier * Int(pow(Double(94), Double(count))))
        count += 1
        
    }
    
    return unHexed
}




