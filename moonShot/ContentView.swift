//  ExpenseItem.swift
//  MoonShot Project 8
//  Day 39 #100DaysOfSwiftUI by Paul Hudson @TwoStraws 1NOV2021
//  Student: yannemal on 6AUG2023

import SwiftUI

    // MARK: - other View / Structs
struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}


struct ContentView: View {
    // MARK: - DATA Content

    // init Class here :
      
 
    var body: some View {
        
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            .opacity(0.7)
            
            Button("Decode JSON") {
                let input = """
                {
                    "name": "YNML Studios",
                    "address": {
                         "street": "345, West Philippine Sea Lane",
                         "city": "Legazpi"
                     }
                }
                """
                
                let data = Data(input.utf8)
                
                if let user = try? JSONDecoder().decode(User.self, from: data) {
                    print(user.address.street)
                    print(user.name)
                }
            }
        }
 
    } // end body some view THEN
           
        /* ************************************************************* */
        /*                                                               */
        /*                      MARK: - METHOD                           */
        /*                                                               */
        /* ************************************************************* */
        
} // endContentView


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

