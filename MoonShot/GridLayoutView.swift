//
//  GridLayoutView.swift
//  MoonShot
//
//  Created by Chuck Condron on 7/1/23.
//

import SwiftUI

struct GridLayoutView: View {
  let columns = [
    GridItem(.adaptive(minimum: 150))
  ]
  
  let astronauts: [String: Astronaut]
  let missions: [Mission]
  
  
  var body: some View {
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
                .padding()
              
              VStack {
                Text(mission.displayName)
                  .font(.headline)
                  .foregroundColor(.white)
                Text(mission.formattedLaunchDate)
                  .font(.caption)
                  .foregroundColor(.white.opacity(0.9))
              }
              .padding(.vertical)
              .frame(maxWidth: .infinity)
              .background(.lightBackground)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .overlay(
              RoundedRectangle(cornerRadius: 10)
                .strokeBorder(.lightBackground, lineWidth: 2.0))
          }
        }
      }
    }
  }
}

struct GridLayoutView_Previews: PreviewProvider {
  static var previews: some View {
    GridLayoutView(astronauts: Bundle.main.decode("astronauts.json"), missions: Bundle.main.decode("missions.json"))
      .preferredColorScheme(.dark)
  }
}
