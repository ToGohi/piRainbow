//
//  Constants.swift
//  piRainbow
//
//  Created by Antonio Gonzalez Hidalgo on 23/05/2020.
//  Copyright © 2020 Antonio Gonzalez Hidalgo. All rights reserved.
//

import Foundation

struct Constants {

  struct Network {
    static let timeOut: Double = 10.0
  }

  struct Literals {
    struct Errors {
      static let noConnection = "You don't have connection"
      static let timeOut = "Time Out"
      static let unauthorized = "Invalid credentials"
      static let unknownError = "Unknow Error."
    }
  }
}
