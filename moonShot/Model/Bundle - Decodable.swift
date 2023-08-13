//  bundle extension.swift
//  MoonShot Project 8
//  Day 40 #100DaysOfSwiftUI by Paul Hudson @TwoStraws 1NOV2021
//  Student: yannemal on 6AUG2023
//  extension for the project

import Foundation


extension Bundle {
    // this method wil accept any fileName and look it up in the Bundle (Assets on device) return it as as long as it conforms to Codable.
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
     
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        //with dates received online add specific timezone in other projects
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        return loaded
    }
}
// made it more generic using <T> instead of specifically astronaut
// the Fatal Error here is appropriate for I provide the JSON on device not online then you would want to be able to recover
// we've now succesfully moved all this code out of our ContentView
// can I make my own JSON for something completely different ? Like my ancient X-men team builder app.
