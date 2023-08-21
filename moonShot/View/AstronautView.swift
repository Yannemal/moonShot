//
//  AstronautView.swift
//  MoonShot Project 8
//  Day 40 #100DaysOfSwiftUI by Paul Hudson @TwoStraws 1NOV2021
//  Student: yannemal on 21AUG2023

import SwiftUI

// MARK: - other View / Structs

struct AstronautView: View {
    // MARK: - DATA Content
    let astronaut: Astronaut

    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        } // end ScrollView
        .background(.darkBackGround)
        .navigationTitle(astronaut.name)
        // to make it look small
        .navigationBarTitleDisplayMode(.inline)
    }
    
    /* ***************************************************** */
    /*                                                       */
    /*                      MARK: - METHOD                   */
    /*                                                       */
    /* ***************************************************** */
    
}
// MARK: - PREVIEW
// needs more handson for preview to work here

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
            .preferredColorScheme(.dark)
    }
}
