//
//  EFunctions.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 12/29/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.
//

import Foundation


//Encryption

var primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997, 1009, 1013, 1019, 1021, 1031, 1033, 1039, 1049, 1051, 1061, 1063, 1069, 1087, 1091, 1093, 1097, 1103, 1109, 1117, 1123, 1129, 1151, 1153, 1163, 1171, 1181, 1187, 1193, 1201, 1213, 1217, 1223, 1229, 1231, 1237, 1249, 1259, 1277, 1279, 1283, 1289, 1291, 1297, 1301, 1303, 1307, 1319, 1321, 1327, 1361, 1367, 1373, 1381, 1399, 1409, 1423, 1427, 1429, 1433, 1439, 1447, 1451, 1453, 1459, 1471, 1481, 1483, 1487, 1489, 1493, 1499, 1511, 1523, 1531, 1543, 1549, 1553, 1559, 1567, 1571, 1579, 1583, 1597, 1601, 1607, 1609, 1613, 1619, 1621, 1627, 1637, 1657, 1663, 1667, 1669, 1693, 1697, 1699, 1709, 1721, 1723, 1733, 1741, 1747, 1753, 1759, 1777, 1783, 1787, 1789, 1801, 1811, 1823, 1831, 1847, 1861, 1867, 1871, 1873, 1877, 1879, 1889, 1901, 1907, 1913, 1931, 1933, 1949, 1951, 1973, 1979, 1987, 1993, 1997, 1999, 2003, 2011, 2017, 2027, 2029, 2039, 2053, 2063, 2069, 2081, 2083, 2087, 2089, 2099, 2111, 2113, 2129, 2131, 2137, 2141, 2143, 2153, 2161, 2179, 2203, 2207, 2213, 2221, 2237, 2239, 2243, 2251, 2267, 2269, 2273, 2281, 2287, 2293, 2297, 2309, 2311, 2333, 2339, 2341, 2347, 2351, 2357, 2371, 2377, 2381, 2383, 2389, 2393, 2399, 2411, 2417, 2423, 2437, 2441, 2447, 2459, 2467, 2473, 2477, 2503, 2521, 2531, 2539, 2543, 2549, 2551, 2557, 2579, 2591, 2593, 2609, 2617, 2621, 2633, 2647, 2657, 2659, 2663, 2671, 2677, 2683, 2687, 2689, 2693, 2699, 2707, 2711, 2713, 2719, 2729, 2731, 2741, 2749, 2753, 2767, 2777, 2789, 2791, 2797, 2801, 2803, 2819, 2833, 2837, 2843, 2851, 2857, 2861, 2879, 2887, 2897, 2903, 2909, 2917, 2927, 2939, 2953, 2957, 2963, 2969, 2971, 2999]


func encrypt(_ password: String, _ cipher: String) -> String
{
    var encryptedPassword = ""
    
//    print(password)
    var encryptedL1 = encryption1(cipher, password)
//    print("Encryption 1: " + encryptedL1)
    var encryptedL2 = encryption2(cipher, encryptedL1)
//    print("Encryption 2: " + encryptedL2)
    var encryptedL3 = encryption3(cipher, encryptedL2)
//    print("Encryption 3: " + encryptedL3)
    var encryptedL4 = encryption4(cipher, encryptedL3)
//    print("Encryption 4: " + encryptedL4)
    var encryptedL5 = encryption5(encryptedL4)
//    print("Encryption 5: " + encryptedL5)
    
    encryptedPassword = encryptedL5

    return encryptedPassword
}



func adjustedEncrypt(_ password: String, _ cipher: String) -> String
{
    
    var encryptedPassword = ""
    
    var encryptedL1 = encryption1(cipher, password)
//    print("Encryption 1: " + encryptedL1)
    var encryptedL2 = encryption2(cipher, encryptedL1)
//    print("Encryption 2: " + encryptedL2)
    var encryptedL3 = encryption5(encryptedL2)
//    print("Encryption 3: " + encryptedL3)
    
    encryptedPassword = encryptedL3
    
    return encryptedPassword
}



func createCipher() -> String
{
    var cipher = ""
    var values: Array<Int> = [1]
    for num in Range(2...144)
    {
        values.append(num)
    }
    for num in Range(0...143)
    {
        var index = values.index(of: values.randomElement()!)
        cipher += String(values[index!]) + "_"
        values.remove(at: index!)
    }
    
    return cipher
}


private func encryption1(_ cipher: String, _ password: String) -> String
{
    var L1encrypted = ""
    var count = 0
    var add = 0
    var dictionary = createDictionary(cipher)
    for character in password
    {
        count += 1
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
        var value = dictionary.get(String(character)) + add
        if value > 144
        {
            value = value - 144
        }
        L1encrypted += dictionary.get(value)
    }
    
    return L1encrypted

}

private func encryption2(_ cipher: String, _ encryptedL1: String) -> String
{
    var L2encrypted = ""
    var dictionary = createDictionary(cipher)
    var numberEncrypted = ""
    var count = 0
    for character in encryptedL1
    {
        count += 1
        var number = dictionary.get(String(character))
        
        number = number + 1
        
        if count%2 == 0
        {
            number = Int(pow(Double(number), 6))
            number = number + 31
            if count < 300
            {
                number = number * count
            }
        }
        if count%3 == 0
        {
            number = number * 441
            if count < 30
            {
                number = number + Int(pow(Double(count), Double(count/3)))
            }
        }
        if count%4 == 0
        {
            number = number + 17
            if count < 300
            {
                number = number + Int(pow(Double(count), 2))
                number = number + (count * 6)
            }
        }
        numberEncrypted += hex(number) + "»"
    }
    L2encrypted = numberEncrypted
    
    return L2encrypted
}

private func encryption3(_ cipher: String, _ encryptedL2: String) -> String
{
    var L3encrypted = ""
    var dictionary = createDictionary(cipher)
    var hexEncrypt2 = ""
    var index = 0
    for character in encryptedL2
    {
        if character != "»"
        {
            var number = dictionary.get(String(character))
            number = number + 1
            
            if index > 429
            {
                index = index - 429
            }
            number = number * primes[index]
            hexEncrypt2 += hex(number) + "»"
            index += 1
        }
        else
        {
            hexEncrypt2 += "»"
        }
        
    }
    L3encrypted = hexEncrypt2
    
    return L3encrypted
}

private func encryption4(_ cipher: String, _ encryptedL3: String) -> String
{
    var L4encrypted = ""
    var dictionary = createDictionary(cipher)
    var Count = 0
    for character in encryptedL3
    {
        Count += 1
        if character != "»"
        {
            var number = dictionary.get(String(character))
            number = (number * Count)
            number = number + 3
            
            var identifier = 0
            while number > 144
            {
                number = number - 144
                identifier += 1
                
            }
            
            L4encrypted += dictionary.get(number) + "(" + String(identifier) + ")"
        }
        else
        {
            if Count != encryptedL3.count
            {
                L4encrypted += "»"
            }
        }
        
    }
    
    return L4encrypted
}

func encryption5(_ encryptedL4: String) -> String
{
    var L5encrypted = ""
    var jumbledEncryption = ""
    
    var encryptedL4Array = ["a"]
    encryptedL4Array.popLast()
    
    var jumbledArray = ["a"]
    jumbledArray.popLast()
    
    for character in encryptedL4
    {
        encryptedL4Array.append(String(character))
    }
    var count = 0
    for entity in encryptedL4Array
    {
        count += 1
        if count%2 == 1
        {
            jumbledArray.append(encryptedL4Array[encryptedL4Array.count-1])
            encryptedL4Array.remove(at: encryptedL4Array.count-1)
        }
        else
        {
            jumbledArray.append(encryptedL4Array[0])
            encryptedL4Array.remove(at: 0)
        }
    }
    for entity in jumbledArray
    {
        jumbledEncryption += entity
    }
    
    L5encrypted = jumbledEncryption
    
    
    return L5encrypted
}



func createDictionary(_ cipher: String) -> codeE
{
    var Cipher = cipher
    var indexes = [0]
    var index = 0
    indexes.popLast()
    for character in Cipher
    {
        index += 1
        if character == "_"
        {
            indexes.append(Int(Cipher.prefix(index-1))!)
            Cipher = String(Cipher.suffix(Cipher.count - index))
            index = 0
        }
    }
    var dictionary = codeE(indexes[0], indexes[1], indexes[2], indexes[3], indexes[4], indexes[5], indexes[6], indexes[7], indexes[8], indexes[9], indexes[10], indexes[11], indexes[12], indexes[13], indexes[14], indexes[15], indexes[16], indexes[17], indexes[18], indexes[19], indexes[20], indexes[21], indexes[22], indexes[23], indexes[24], indexes[25], indexes[26], indexes[27], indexes[28], indexes[29], indexes[30], indexes[31], indexes[32], indexes[33], indexes[34], indexes[35], indexes[36], indexes[37], indexes[38], indexes[39], indexes[40], indexes[41], indexes[42], indexes[43], indexes[44], indexes[45], indexes[46], indexes[47], indexes[48], indexes[49], indexes[50], indexes[51], indexes[52], indexes[53], indexes[54], indexes[55], indexes[56], indexes[57], indexes[58], indexes[59], indexes[60], indexes[61], indexes[62], indexes[63], indexes[64], indexes[65], indexes[66], indexes[67], indexes[68], indexes[69], indexes[70], indexes[71], indexes[72], indexes[73], indexes[74], indexes[75], indexes[76], indexes[77], indexes[78], indexes[79], indexes[80], indexes[81], indexes[82], indexes[83], indexes[84], indexes[85], indexes[86], indexes[87], indexes[88], indexes[89], indexes[90], indexes[91], indexes[92], indexes[93], indexes[94], indexes[95], indexes[96], indexes[97], indexes[98], indexes[99], indexes[100], indexes[101], indexes[102], indexes[103], indexes[104], indexes[105], indexes[106], indexes[107], indexes[108], indexes[109], indexes[110], indexes[111], indexes[112], indexes[113], indexes[114], indexes[115], indexes[116], indexes[117], indexes[118], indexes[119], indexes[120], indexes[121], indexes[122], indexes[123], indexes[124], indexes[125], indexes[126], indexes[127], indexes[128], indexes[129], indexes[130], indexes[131], indexes[132], indexes[133], indexes[134], indexes[135], indexes[136], indexes[137], indexes[138], indexes[139], indexes[140], indexes[141], indexes[142], indexes[143])

    return dictionary
}

func factorial(_ number: Int) -> Int
{
    var multiplier = number
    var ans = number
    for num in Range(1...(number-1))
    {
        multiplier -= 1
        ans = ans * multiplier
    }
    
    return ans
}

func binaryConversion(_ number: Int) -> String
{
    var binaryCode = ""
    var quotient = number
    while quotient != 0
    {
        if quotient % 2 == 1
        {
            binaryCode += "1"
        }
        else
        {
            binaryCode += "0"
        }
        
        quotient = Int(quotient/2)
    }
    
    return binaryCode
}

func hex(_ number: Int) -> String
{
    var hexCode = ""
    var quotient = number
    while quotient != 0
    {
        var remainder = quotient % 94
        
        hexCode += String(UnicodeScalar(remainder + 33)!)
        
        
        quotient = Int(quotient/94)
    }
    
    return hexCode
}



