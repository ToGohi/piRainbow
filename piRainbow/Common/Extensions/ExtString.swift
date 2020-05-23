//
//  ExtString.swift
//  piRainbow
//
//  Created by Antonio Gonzalez Hidalgo on 23/05/2020.
//  Copyright © 2020 Antonio Gonzalez Hidalgo. All rights reserved.
//

import UIKit

extension String {

  func getFloat() -> CGFloat? {
    guard let tempNumber = NumberFormatter().number(from: self) else { return nil }
    return CGFloat(truncating: tempNumber)
  }

  func getPiComponents() -> [CGFloat] {

    var compoments: [CGFloat] = []
    var cacheComponent: CGFloat = 0
    var tempBufferString: String = ""

    for char in self {
      let charString = String(char)
      tempBufferString += charString
      if let tempNumber = tempBufferString.getFloat() {
        if tempNumber > 255 {
          compoments.append(cacheComponent)
          tempBufferString = charString
        } else {
          cacheComponent = tempNumber
        }
      }
    }

    if let tempBufferFloat = tempBufferString.getFloat() {
      compoments.append(tempBufferFloat)
    }
    return compoments
  }

}
