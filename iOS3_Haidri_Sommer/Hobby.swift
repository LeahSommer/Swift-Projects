//
//  Hobby.swift
//  iOS3_Haidri_Sommer
//
//  Created by  on 23.11.22.
//

import Foundation
func == (left: Hobby, right: Hobby) -> Bool {
    return left.id == right.id
 }
class Hobby: Codable,Equatable {
    let id: UUID
    var name: String
    init(name: String){
        id = UUID ()
        self.name = name
    }
}
