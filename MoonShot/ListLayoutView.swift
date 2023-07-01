//
//  ListLayoutView.swift
//  MoonShot
//
//  Created by Chuck Condron on 7/1/23.
//

import SwiftUI

struct ListLayoutView: View {
  let astronauts: [String: Astronaut]
  let missions: [Mission]
  
  var body: some View {
    List(missions) { mission in
      NavigationLink {
        MissionView(mission: mission, astronauts: astronauts)
      } label: {
        HStack {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .padding()
          
          VStack(alignment: .leading) {
            Text(mission.displayName)
              .font(.headline)
            Text(mission.formattedLaunchDate)
          }
        }
      }
      .listRowBackground(Color.clear)
      .clipShape(RoundedRectangle(cornerRadius: 10.0))
      .overlay(RoundedRectangle(cornerRadius: 10)
        .strokeBorder(.lighterBackground, lineWidth: 2.0))
    }
    .listStyle(.plain)
  }
}

struct ListLayoutView_Previews: PreviewProvider {
  static var previews: some View {
    ListLayoutView(astronauts: Bundle.main.decode("astronauts.json"), missions: Bundle.main.decode("missions.json"))
      .preferredColorScheme(.dark)
  }
}
