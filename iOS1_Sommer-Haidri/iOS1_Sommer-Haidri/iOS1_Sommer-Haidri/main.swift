//
//  main.swift
//  iOS1_Sommer-Haidri
//
//  Created by  on 26.10.22.
//

import Foundation
//import Complext

func readDouble() -> Double{
    
    if let input = readLine(){
        if let num = Double (input){
            return( Double(num))
        }else { return(0.0)
            
        }
    }
    return (0.0)
}

print("real")
var real = readDouble()

print("imag")
var imag = readDouble()

var com = Complext( a: real ,b: imag)

com.incrementBy(x:1.2)
com.incrementBy(y:2.4)
print("", com.real, "i ",com.img)

com.incrementBy(x:2.2)
print("", com.real, "i ",com.img)

com.incrementBy(y:0.6)
print("", com.real, "i ",com.img)

com.multiplyBy(x:Complext(a:0.5,b:1.0))
print("", com.real, "i ",com.img)

com.rotateBy(x:Double.pi)
print("", com.real, "i ",com.img)

var comp = com.plus(z: Complext (a:0.2,b:0.9))
print("", comp.real, "i ",comp.img)









