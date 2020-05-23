//
//  PiColor.swift
//  piRainbow
//
//  Created by Antonio Gonzalez Hidalgo on 23/05/2020.
//  Copyright © 2020 Antonio Gonzalez Hidalgo. All rights reserved.
//

import UIKit

struct PiColor {
  let red: CGFloat
  let green: CGFloat
  let blue: CGFloat

  var title: String? {
    return "r: \(String(format: "%.0f", red)) g: \(String(format: "%.0f", green)) b:\(String(format: "%.0f", blue))"
  }

  func uiColor() -> UIColor {
    return UIColor(red: red / 255.0,
                   green: green / 255.0,
                   blue: blue / 255.0,
                   alpha: 1.0)
  }
}
