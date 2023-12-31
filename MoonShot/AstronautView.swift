//
//  AstronautView.swift
//  MoonShot
//
//  Created by Chuck Condron on 6/27/23.
//

import SwiftUI

struct AstronautView: View {
  let astronaut: Astronaut
  
  var body: some View {
    GeometryReader { geometry in
      Image("stars")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .ignoresSafeArea()
        .frame(width: geometry.size.width, height: geometry.size.height)
      ScrollView {
        VStack {
          Image(astronaut.id)
            .resizable()
            .scaledToFit()
          
          Text(astronaut.description)
            .padding()
        }
      }
    }
    .background(.darkBackground)
    .navigationTitle(astronaut.name)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct AstronautView_Previews: PreviewProvider {
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  
  static var previews: some View {
    AstronautView(astronaut: astronauts["aldrin"]!)
      .preferredColorScheme(.dark)
  }
}
