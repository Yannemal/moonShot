//  ContentView.swift
//  MoonShot Project 8
//  Day 40 #100DaysOfSwiftUI by Paul Hudson @TwoStraws 1NOV2021
//  Student: yannemal on 6AUG2023

import SwiftUI

    // MARK: - other View / Structs



struct ContentView: View {
    // MARK: - DATA Content
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
 
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                LazyVGrid(columns: columns) {
                 
                    ForEach(missions) { mission in
                        NavigationLink {
                           MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    //to help get the image away from the border
                                    .padding()
                                    
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                      
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))

                                } // end VStack Text for logos
                                
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                                .overlay(Text("▶︎▶︎▶︎").foregroundColor(.darkBackGround), alignment: .trailing)
                                .overlay(Text("◀︎◀︎◀︎").foregroundColor(.darkBackGround), alignment: .leading)
                                
                                
                            } //end VStack Logo & Text VStack
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                            
                        }
                   
                    }
                } // end LazyGrid
                .padding([.horizontal, .bottom])
               
                
            }
            .navigationTitle("Moonshot")
            .background(.darkBackGround)
            .preferredColorScheme(.dark)
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

