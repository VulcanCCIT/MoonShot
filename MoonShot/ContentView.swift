//
//  ContentView.swift
//  MoonShot
//
//  Created by Chuck Condron on 6/23/23.
//

import SwiftUI

struct ContentView: View {
  let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  let missions: [Mission] = Bundle.main.decode("missions.json")
  
  //Paul's suggestion below does not toggle back after you change it once... odd
  //@AppStorage("showingGrid") private var showingGrid = true
  @State private var showingGrid = true
  
  var body: some View {
    NavigationView {
      GeometryReader { geometry in
        Image("stars")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .ignoresSafeArea()
          .frame(height: geometry.size.height)
        Group {
          if showingGrid {
            GridLayoutView(astronauts: astronauts, missions: missions)
          } else {
            ListLayoutView(astronauts: astronauts, missions: missions)
              .scrollContentBackground(.hidden)
          }
        }
        .padding(8)
        .toolbar {
          Button {
            showingGrid.toggle()
          } label: {
            if showingGrid {
              Label("Show as table", systemImage: "list.star")
            } else {
              Label("Show as grid", systemImage: "rectangle.grid.2x2")
            }
          }
        }
      }
      .navigationTitle("Moonshots")
      .background(.darkBackground)
      .preferredColorScheme(.dark)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
