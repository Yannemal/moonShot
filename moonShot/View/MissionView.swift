//
//  MissionView.swift
//  MoonShot Project 8
//  Day 40 #100DaysOfSwiftUI by Paul Hudson @TwoStraws 1NOV2021
//  Student: yannemal on 6AUG2023

import SwiftUI

// MARK: - other View / Structs


struct MissionView: View {
    // MARK: - DATA Content
    let mission: Mission
    // init Class here :
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                    } // inner VStack
                    .padding(.horizontal)
                } // outer Vstack
                .padding(.bottom)
                // to help w iOS buttons on the bottom of the screen
            }
            
        } // end outermost Stack
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        // to get less chunky titles for NavStack
        .background(.darkBackGround)
        
    } // end body some view THEN
    
    /* ***************************************************** */
    /*                                                       */
    /*                      MARK: - METHOD                   */
    /*                                                       */
    /* ***************************************************** */
    
} // end MissionView


// MARK: - PREVIEW
// needs more handson for preview gto work here
struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        MissionView(mission: missions[0])
            .preferredColorScheme(.dark)
    }
}

