//
//  MissionView.swift
//  MoonShot
//
//  Created by Chuck Condron on 6/27/23.
//

import SwiftUI

struct MissionView: View {
  
  @State private var commander = false
  
  struct CrewMember {
    let role: String
    let astronaut: Astronaut
  }
  
  let mission: Mission
  let crew: [CrewMember]
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Image("stars")
      }
      ScrollView {
        VStack {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: geometry.size.width * 0.6)
            .padding(.top)
          
          VStack(alignment: .leading) {
            
            Rectangle()
              .frame(height: 2)
              .foregroundColor(.lightBackground)
              .padding(.vertical)
            
            Text("Mission Highlights")
              .font(.title.bold())
              .padding(.bottom, 5)
            
            Text(mission.description)
            
            Rectangle()
              .frame(height: 2)
              .foregroundColor(.lightBackground)
              .padding(.vertical)
            
            Text("Mission Crew")
              .font(.title.bold())
              .padding(.bottom, 5)
          }
          .padding(.horizontal)
          
          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              ForEach(crew, id: \.role) { crewMember in
                NavigationLink {
                  AstronautView(astronaut: crewMember.astronaut)
                } label: {
                  HStack {
                    Image(crewMember.astronaut.id)
                      .resizable()
                      .frame(width: 104, height: 72)
                      .clipShape(Capsule())
                      .overlay(
                        Capsule()
                          .strokeBorder(.white, lineWidth: 1)
                      )
                    
                    VStack(alignment: .leading) {
                      Text(crewMember.astronaut.name)
                        .foregroundColor(.white)
                        .font(.title2)
                      Text(crewMember.role)
                        .foregroundColor(crewMember.role == "Command Pilot" ? .red : .white)
                        .fontWeight(.bold)                        
                    }
                    
                  }
                  Image(systemName: "moon.stars.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .opacity(0.7)
                  .padding(.horizontal)                  }
              }
            }
          }
          
        }
        .padding(.bottom)
      }
    }
    .navigationTitle(mission.displayName)
    .navigationBarTitleDisplayMode(.inline)
    .background(.darkBackground)
  }
  
  init(mission: Mission, astronauts: [String: Astronaut]) {
    self.mission = mission
    
    self.crew = mission.crew.map { member in
      if let astronaut = astronauts[member.name] {
        return CrewMember(role: member.role, astronaut: astronaut)
      } else {
        fatalError("Missing \(member.name)")
      }
    }
  }
  
}

struct MissionView_Previews: PreviewProvider {
  static let missions: [Mission] = Bundle.main.decode("missions.json")
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  
  static var previews: some View {
    MissionView(mission: missions[0], astronauts: astronauts)
      .preferredColorScheme(.dark)
  }
}
