//
//  MissionView.swift
//  MoonShot Project 8
//  Day 40 #100DaysOfSwiftUI by Paul Hudson @TwoStraws 1NOV2021
//  Student: yannemal on 6AUG2023

import SwiftUI

// MARK: - other View / Structs


struct MissionView: View {
    // nested structs
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    // MARK: - DATA Content
    let mission: Mission
    let crew: [CrewMember]
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
                    
                    Rectangle()
                        .frame(height: 8)
                        .foregroundColor(.lightBackground)
                        .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                    } // inner VStack
                    .padding(.horizontal)
                    
                    Rectangle()
                        .frame(height: 8)
                        .foregroundColor(.lightBackground)
                        .padding(.vertical)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            // ,role is defined in Mission.swift
                            ForEach(crew, id: \.role) { crewMember in
                                NavigationLink {
                                    AstronautView(astronaut: crewMember.astronaut)
                                    // add new SwiftUI View details here
                                } label: {
                                    HStack {
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                        //size image is based on supplied images and hardcoded
                                            .frame(width: 104, height: 72)
                                            .clipShape(Capsule())
                                            .overlay(
                                                Capsule()
                                                // stroke is half inside half outside. .strokeBorder is completely indside shape
                                                    .strokeBorder(.white,
                                                                  lineWidth: 1)
                                                                 )
                                        VStack(alignment: .leading) {
                                            Text(crewMember.astronaut.name)
                                                .foregroundColor(.white)
                                                .font(.headline)
                                            
                                            Text(crewMember.role)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    } // end inner scrollView crew details
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
    
    // custom init
    init(mission: Mission, astronauts: [String: Astronaut])  {
        self.mission = mission
        // merging information from different JSONs provided
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
            
        }
        
    }
    
    /* ***************************************************** */
    /*                                                       */
    /*                      MARK: - METHOD                   */
    /*                                                       */
    /* ***************************************************** */
    
} // end MissionView


// MARK: - PREVIEW
// needs more handson for preview to work here
struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}

