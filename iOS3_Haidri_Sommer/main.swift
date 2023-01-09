//
//  main.swift
//  iOS3_Haidri_Sommer
//
//  Created by  on 23.11.22.
//


import Foundation

var newAddressBook = AddressBook()
let path = "book.json"
if let book = AddressBook.addressBook(fromFile: path){
    newAddressBook = book
}

func Main(){
    var running = true
    while running {
        let command = read(withPrompt: "(A)dd, (S)earch, (L)ist, (Q)uit")
        switch command{
        case "a":
            print("Adding a new contact: ")

                let Vorname = read(withPrompt: "First Name: ")

                let Nachname = read(withPrompt: "Last Name: ")

                let Straße = read(withPrompt: "Street: ")

                var Postleitzahl = Int(read(withPrompt: "Post Code: ")) 

                let Ort = read(withPrompt: "Ort: ")

                /*var hobbies: [String] = []
                var insertHobby = true
                while insertHobby {
                    let hobby = read(withPrompt: "Hobby: (Cancel with (Q)) ")
                    if hobby == "q"{
                        insertHobby = false
                    }
                    else {
                        hobbies.append(hobby)
                    }
        }*/
            
        case "s":
            if let card = newAddressBook.findCard(name: read(withPrompt: "Search Last Name: ")) {
                    card.printInfo()
                    var running = true
                    while running {
                        let command = read(withPrompt: "(F)riend, (D)elet, (R)eturn")

                        switch command {
                        case "f":
                            addFriend(user: card)
                        case "d" :
                            newAddressBook.remove(card: card)
                            print("Contact is deleted!")
                            running = false
                        case "r" :
                            running = false
                        default:
                            print("enter a valid command!")
                        }
                    }
                } else {
                    print("Contact not found!")
                }
            
        case "l":
            listAdressCards()
        case "q":
            newAddressBook.save(toFile: path)
            running = false
            
        default:
            print("Enter something: ")
        
    },
}
    
    func listAdressCards(){
        
            print("-----------------------")
            newAddressBook.sort()
            for contact in newAddressBook.addressCards{
                contact.printInfo()
            }
        }
    
    func addFriend(user: AddressCard){
        let friendName = read(withPrompt: "Friend's Last Name: ")

            if let friend = newAddressBook.findCard(name: friendName) {
                if friend.Vorname == friendName {
                        user.addFriend(friend: friend)
                       
                        print("'\(friend.Vorname) \(friend.Nachname)' is added.")
                    }
                }else {
                print("Friend not found!")
            }
        }
    }


   /* func addAddressCard(){
        var AddressCard: AddressCard
     Addresscard.Vorname = read(withPrompt : "Vorname: ")
        
       Addresscard.Nachname = read(withPrompt : "Nachname: ")
    
       Addresscard.Straße = read(withPrompt : "Straße: ")
        
        //ubung1 (withPrompt : "Postleitzahl: ")
        //fdi
        
        if let input = readLine(){
            if let num = Int (input){
                Addresscard.Postleitzahl = Int(num)
            }
            else{
                Addresscard.Postleitzahl = 0
            }
        }
            
        
        Addresscard.Ort = read(withPrompt : "Ort: ")

        var insertHobbys = true
        while insertHobbys {
            let Hobbies = read(withPrompt : "Hobbys:  (Q = cancel)")
            if Hobbies == "q" {
                insertHobbys = false
            } else { AddressCard.addHobby(hobby: Hobby)}
        }
        newAddressBook.add(card: card)
    }*/




    func read(withPrompt : String) -> String {
        print(withPrompt,terminator: "")
        return readLine() ?? "ivalid input"
    }


   /* func findCardByName(name: String){
       
              if let card = newAddressBook.findCard(name: name){
                 // card.printInfo
                  var running = true
                  while running {
                      let command = read(withPrompt: "(F)riend, (D)elete, (R)eturn")
                      //see ubung 2 switch
                      switch command {
                      case "f":
                          //to be reviewed
                          AddressBook.addFriend(friend: card)
                      case "d":
                          AddressBook.remove(card: card)
                          running = false

                      case "r":
                          running = false
                          
                      default:
                          print("not found")
                      }
                  }
              } else {print("Contact does not exist")}
          }*/


Main()



