//
//  AddressBook.swift
//  iOS3_Haidri_Sommer
//
//  Created by  on 23.11.22.
//

import Foundation
class AddressBook:  Codable, Encodable {
    var adressKarten: [AddressCard] = [ ]
    func add(card: AddressCard){
        adressKarten.append(card)
    }
    func remove(card: AddressCard){
        //let index = find(adressKarten, card)
        if let indexOfA = adressKarten.firstIndex(of: card) {
            adressKarten.remove(at : indexOfA )
        }
    }
    func sort(){
        adressKarten.sort(by: { s1, s2 in return s1.Nachname>s2.Nachname} )
    }
    func findCard(name: String) ->  AddressCard? {
        var found: Bool = false
        var i = 0;
        while(!found && i<adressKarten.count){
            if adressKarten[i].Nachname == name {
                found = true
                return adressKarten[i]
            }
            i+=1
        }
        if(!found){
            return nil
        }
    }
    func findCard(id: UUID) -> AddressCard? {
        var found: Bool = false
        var i = 0;
        while(!found && i<adressKarten.count){
            if adressKarten[i].id == id {
                found = true
                return adressKarten[i]
            }
            i+=1  }
        if(!found){
            return nil
        }
    }
    
    
    
    func friendsOf(card: AddressCard) -> [UUID]   {
        // var friends: [AddressCard] = [ ]
        var id = card.id
        var adressCard : AddressCard? = findCard(id : id)
        return adressCard!.Friend
    }
    
    func save(toFile path: String) {
        let encoder = JSONEncoder()
        let path = "book.json"
        let url = URL (fileURLWithPath: path)
        if let data = try? encoder.encode(AddressBook) {
            try? data.write(to: url)
        }
        
    }
    class func addressBook(fromFile path: String) -> AddressBook?{
        let url = URL (fileURLWithPath: path)
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let AddressBook =
                try? decoder.decode(AddressBook.self, from: data) {
                print(AddressBook)
            }
        }
    }
}
