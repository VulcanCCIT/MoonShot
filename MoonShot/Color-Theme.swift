//
//  Color-Theme.swift
//  MoonShot
//
//  Created by Chuck Condron on 6/26/23.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
  static var darkBackground: Color {
    Color(red: 0.1, green: 0.1, blue: 0.2)
  }
  
  static var lightBackground: Color {
    Color(red: 0.3, green: 0.3, blue: 0.4)
  }
  
  static var lighterBackground: Color {
    Color(red: 0.6, green: 0.6, blue: 0.7)
  }
}
