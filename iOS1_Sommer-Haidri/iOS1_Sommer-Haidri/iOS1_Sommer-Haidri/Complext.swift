//
//  Complext.swift
//  iOS1_Sommer-Haidri
//
//  Created by  on 26.10.22.
//


import Foundation
class Complext{
    var real=0.0
    var img=0.0
    init(a: Double, b: Double) {
        self.real = a
        self.img = b
    }
    func incrementBy(x:Double){
        real+=x
    }
    func incrementBy(y:Double){
        img+=y
    }
    func incrementBy(x:Complext){
        real+=x.real
        img+=x.img
    }
    func multiplyBy(x:Complext){
        
        let realtwo = (real*(x.real)-img*(x.img))
        let imgtwo = (real*(x.img)+img*(x.real))
        
        real = realtwo
        img = imgtwo
    }
    func rotateBy(x:Double){
        let comp = Complext(a:cos(x),b:sin(x) )
        multiplyBy(x:comp)
    }
    func plus(z:Complext)->Complext{
        var comp = Complext(a:real,b:img)
        comp.incrementBy(x:z.real)
        comp.incrementBy(y:z.img)
        return comp
    }
}
