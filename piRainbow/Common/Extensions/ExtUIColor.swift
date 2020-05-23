//
//  ExtUIColor.swift
//  piRainbow
//
//  Created by Antonio Gonzalez Hidalgo on 23/05/2020.
//  Copyright © 2020 Antonio Gonzalez Hidalgo. All rights reserved.
//

import UIKit

extension UIColor {

  var inverse: UIColor {

    let ciColor = CIColor(color: self)

    let compRed: CGFloat = 1.0 - ciColor.red
    let compGreen: CGFloat = 1.0 - ciColor.green
    let compBlue: CGFloat = 1.0 - ciColor.blue

    return UIColor(red: compRed, green: compGreen, blue: compBlue, alpha: 1.0)
  }

}
