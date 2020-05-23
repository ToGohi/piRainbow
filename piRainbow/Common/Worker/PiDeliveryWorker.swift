//
//  PiDeliveryWorker.swift
//  piRainbow
//
//  Created by Antonio Gonzalez Hidalgo on 23/05/2020.
//  Copyright © 2020 Antonio Gonzalez Hidalgo. All rights reserved.
//

import Foundation

class PiDeliveryWorker {

  var store: PiDeliveryStoreProtocol!

  init(store: PiDeliveryStoreProtocol) {
    self.store = store
  }

  func getPiNumbers(start: Int,
                    numberOfDigits: Int,
                    completion: @escaping(PiDeliveryStoreResult<PiDeliveryResponse>) -> Void) {
    store.getPiNumbers(start: start, numberOfDigits: numberOfDigits, completion: completion)
  }

}
