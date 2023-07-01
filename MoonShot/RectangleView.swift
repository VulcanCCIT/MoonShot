//
//  RectangleView.swift
//  MoonShot
//
//  Created by Chuck Condron on 7/1/23.
//

import SwiftUI

struct RectangleView: View {
  var body: some View {
    Rectangle()
      .frame(height: 2)
      .foregroundColor(.lightBackground)
      .padding(.vertical)
  }
}

struct RectangleView_Previews: PreviewProvider {
  static var previews: some View {
    RectangleView()
  }
}
