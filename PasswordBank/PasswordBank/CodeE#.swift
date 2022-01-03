//
//  CodeE#.swift
//  PasswordBank
//
//  Created by Kaden  Stillwagon on 12/28/20.
//  Copyright © 2020 Kaden Stillwagon. All rights reserved.


import Foundation


var theCode = codeE(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144)



class codeE
{
    var code: Dictionary<Int, String> = [0:""]

    init(_ a: Int, _ b: Int, _ c: Int, _ d: Int, _ e: Int, _ f: Int, _ g: Int, _ h: Int, _ i: Int, _ j: Int, _ k: Int, _ l: Int, _ m: Int, _ n: Int, _ o: Int, _ p: Int, _ q: Int, _ r: Int, _ s: Int, _ t: Int, _ u: Int, _ v: Int, _ w: Int, _ x: Int, _ y: Int, _ z: Int, _ aa: Int, _ ab: Int, _ ac: Int, _ ad: Int, _ ae: Int, _ af: Int, _ ag: Int, _ ah: Int, _ ai: Int, _ aj: Int, _ ak: Int, _ al: Int, _ am: Int, _ an: Int, _ ao: Int, _ ap: Int, _ aq: Int, _ ar: Int, _ at: Int, _ au: Int, _ av: Int, _ aw: Int, _ ax: Int, _ ay: Int, _ az: Int, _ ba: Int, _ bb: Int, _ bc: Int, _ bd: Int, _ be: Int, _ bf: Int, _ bg: Int, _ bh: Int, _ bi: Int, _ bj: Int, _ bk: Int, _ bl: Int, _ bm: Int, _ bn: Int, _ bo: Int, _ bp: Int, _ bq: Int, _ br: Int, _ bs: Int, _ bt: Int, _ bu: Int, _ bv: Int, _ bw: Int, _ bx: Int, _ by: Int, _ bz: Int, _ ca: Int, _ cb: Int, _ cc: Int, _ cd: Int, _ ce: Int, _ cf: Int, _ cg: Int, _ ch: Int, _ ci: Int, _ cj: Int, _ ck: Int, _ cl: Int, _ cm: Int, _ cn: Int, _ co: Int, _ cp: Int, _ cq: Int, _ cr: Int, _ cs: Int, _ ct: Int, _ cu: Int, _ cv: Int, _ cw: Int, _ cx: Int, _ cy: Int, _ cz: Int, _ da: Int, _ db: Int, _ dc: Int, _ dd: Int, _ de: Int, _ df: Int, _ dg: Int, _ dh: Int, _ di: Int, _ dj: Int, _ dk: Int, _ dl: Int, _ dm: Int, _ dn: Int, _ dp: Int, _ dq: Int, _ dr: Int, _ ds: Int, _ dt: Int, _ du: Int, _ dv: Int, _ dw: Int, _ dx: Int, _ dy: Int, _ dz: Int, _ ea: Int, _ eb: Int, _ ec: Int, _ ed: Int, _ ee: Int, _ ef: Int, _ eg: Int, _ eh: Int, _ ei: Int, _ ej: Int, _ ek: Int, _ el: Int, _ em: Int, _ en: Int, _ eo: Int, _ ep: Int)
    {
        code[a] = "a"
        code[b] = "b"
        code[c] = "c"
        code[d] = "d"
        code[e] = "e"
        code[f] = "f"
        code[g] = "g"
        code[h] = "h"
        code[i] = "i"
        code[j] = "j"
        code[k] = "k"
        code[l] = "l"
        code[m] = "m"
        code[n] = "n"
        code[o] = "o"
        code[p] = "p"
        code[q] = "q"
        code[r] = "r"
        code[s] = "s"
        code[t] = "t"
        code[u] = "u"
        code[v] = "v"
        code[w] = "w"
        code[x] = "x"
        code[y] = "y"
        code[z] = "z"
        code[aa] = "A"
        code[ab] = "B"
        code[ac] = "C"
        code[ad] = "D"
        code[ae] = "E"
        code[af] = "F"
        code[ag] = "G"
        code[ah] = "H"
        code[ai] = "I"
        code[aj] = "J"
        code[ak] = "K"
        code[al] = "L"
        code[am] = "M"
        code[an] = "N"
        code[ao] = "O"
        code[ap] = "P"
        code[aq] = "Q"
        code[ar] = "R"
        code[at] = "S"
        code[au] = "T"
        code[av] = "U"
        code[aw] = "V"
        code[ax] = "W"
        code[ay] = "X"
        code[az] = "Y"
        code[ba] = "Z"
        code[bb] = "0"
        code[bc] = "1"
        code[bd] = "2"
        code[be] = "3"
        code[bf] = "4"
        code[bg] = "5"
        code[bh] = "6"
        code[bi] = "7"
        code[bj] = "8"
        code[bk] = "9"
        code[bl] = "!"
        code[bm] = "@"
        code[bn] = "#"
        code[bo] = "$"
        code[bp] = "%"
        code[bq] = "^"
        code[br] = "&"
        code[bs] = "*"
        code[bt] = "("
        code[bu] = ")"
        code[bv] = "-"
        code[bw] = "_"
        code[bx] = "="
        code[by] = "+"
        code[bz] = "["
        code[ca] = "]"
        code[cb] = "{"
        code[cc] = "}"
        code[cd] = "|"
        code[ce] = ";"
        code[cf] = ":"
        code[cg] = "'"
        code[ch] = ","
        code[ci] = "."
        code[cj] = "<"
        code[ck] = ">"
        code[cl] = "/"
        code[cm] = "?"
        code[cn] = "`"
        code[co] = "~"
        code[cp] = "Ω"
        code[cq] = "≈"
        code[cr] = "ç"
        code[cs] = "√"
        code[ct] = "∫"
        code[cu] = "˜"
        code[cv] = "µ"
        code[cw] = "≤"
        code[cx] = "≥"
        code[cy] = "÷"
        code[cz] = "å"
        code[da] = "ß"
        code[db] = "∂"
        code[dc] = "ƒ"
        code[dd] = "©"
        code[de] = "◊"
        code[df] = "∆"
        code[dg] = "˚"
        code[dh] = "¬"
        code[di] = "…"
        code[dj] = "æ"
        code[dk] = "«"
        code[dl] = "‘"
        code[dm] = "“"
        code[dn] = "π"
        code[dp] = "ø"
        code[dq] = "ˆ"
        code[dr] = "¨"
        code[ds] = " "
        code[dt] = "¥"
        code[du] = "†"
        code[dv] = "®"
        code[dw] = "´"
        code[dx] = "∑"
        code[dy] = "œ"
        code[dz] = "¿"
        code[ea] = "¡"
        code[eb] = "™"
        code[ec] = "£"
        code[ed] = "¢"
        code[ee] = "∞"
        code[ef] = "§"
        code[eg] = "¶"
        code[eh] = "•"
        code[ei] = "ª"
        code[ej] = "º"
        code[ek] = "–"
        code[el] = "≠"
        code[em] = "\""
        code[en] = "\\"
        code[eo] = "\n"
        code[ep] = "\t"
    
    }

    func get(_ character: String) -> Int
    {
        var theKey = 0
        for key in code.keys
        {
            if code[key] == character
            {
                theKey = key
            }
        }
        return theKey
    }

    func get(_ num: Int) -> String
    {
        return code[num]!
    }
    
    func isSupported(_ character: String) -> Bool
    {
        var supported = false
        for number in Range(1...144)
        {
            if code[number] == character
            {
                supported = true
            }
        }
        
        return supported
    }
}

func printAll()
{
    for num in Range(1...144)
    {
        print(theCode.get(num))
    }
}


