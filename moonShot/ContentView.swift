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

    let layout = [
        GridItem(.flexible(minimum: 30, maximum: 80)),
        GridItem(.flexible(minimum: 20, maximum: 40)),
        GridItem(.flexible(minimum: 50, maximum: 120))
           ]
 
    var body: some View {
        
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            .opacity(0.7)

            ScrollView {
                LazyVGrid(columns: layout, spacing: 5) {
                    ForEach(0..<499, id: \.self) {
                        Text("code \($0)")
                        Color.red
                        
                       
                        Color.indigo.frame(width: 10, height: 50)
                    }
                }
            }
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
                .padding(15)
                .foregroundColor(.black)
                .background(Color.white)
                .border(Color.black, width: 5)
            
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

