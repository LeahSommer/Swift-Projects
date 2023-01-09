//
//  AddressCard.swift
//  iOS3_Haidri_Sommer
//
//  Created by  on 23.11.22.
//

import Foundation
import Foundation


class AddressCard : Identifiable, Codable, Equatable, Hashable{

    var id : UUID

    static func == (lhs : AddressCard, rhs : AddressCard) -> Bool{
        lhs.id == rhs.id
    }


    init(Vorname : String, Nachname : String, Straße : String, Postleitzahl : Int, Ort : String, Hobbys : [Hobby], Friend : [UUID] ){

        self.Vorname = Vorname
        self.Nachname = Nachname
        self.Straße = Straße
        self.Postleitzahl = Postleitzahl
        self.Ort = Ort
        self.Hobbys = Hobbys
        self.Friend = Friend
        id = UUID()
    }

    var Vorname : String
    var Nachname : String
    var Straße : String
    var Postleitzahl : Int
    var Ort : String
    var Hobbys : [Hobby]
    var Friend : [UUID]

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }


    func addHobby(hobby: Hobby){
        Hobbys.append(hobby)
    }

    func remove(hobby: Hobby){

        if let i = Hobbys.firstIndex(of: hobby){
            Hobbys.remove(at: i)
        }
    }

    func addFriend(friend: AddressCard){
        Friend.append(friend.id)
    }

    func remove(friend: AddressCard){
        if let i = Friend.firstIndex(of: friend.id){
            Friend.remove(at: i)
        }
    }
    
    func printInfo(){
        print("|\(Vorname) \(Nachname)")
                print("| \(Straße) ")
                print("| \(Postleitzahl) \(Ort)")
                print("| Hobbys:")
                for String in Hobbys {
                    print("|      \(String)")
                }
                print("| Friends:")
              //  for AddressCard in Friend {
               //     print("|      \(AddressCard.Vorname) \(AddressCard.Nachname)")
               // }
                print("+--------------------------------------")

            }
}



/* equatable ??*/
