//
//  MissionScrollView.swift
//  MoonShot
//
//  Created by Chuck Condron on 7/1/23.
//

import SwiftUI

struct MissionScrollView: View {
  let crew: [MissionView.CrewMember]
  
  var body: some View {
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
              .padding(.horizontal)            
          }
        }
      }
    }
  }
}

struct MissionScrollView_Previews: PreviewProvider {
  static var previews: some View {
    MissionScrollView(crew: [])
  }
}
