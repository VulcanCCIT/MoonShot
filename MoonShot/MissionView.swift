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
      Image("stars")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .ignoresSafeArea()
        .frame(width: geometry.size.width, height: geometry.size.height)
      
      ScrollView {
        VStack {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: geometry.size.width * 0.6)
            .padding(.vertical)
          
          if let date = mission.launchDate {
            Label(date.formatted(date: .complete, time: .omitted), systemImage: "calendar")
              .font(.body)
              .foregroundColor(.white)
              .fontWeight(.bold)
          }
          
          VStack(alignment: .leading) {
            
            RectangleView()
            
            Text("Mission Highlights")
              .font(.title.bold())
              .padding(.bottom, 5)
            
            Text(mission.description)
            
            RectangleView()
            
            Text("Mission Crew")
              .font(.title.bold())
              .padding(.bottom, 5)
          }
          .padding(.horizontal)
          
          MissionScrollView(crew: crew)
          
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
