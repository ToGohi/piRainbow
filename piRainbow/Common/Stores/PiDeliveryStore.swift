//
//  PiDeliveryStore.swift
//  piRainbow
//
//  Created by Antonio Gonzalez Hidalgo on 23/05/2020.
//  Copyright © 2020 Antonio Gonzalez Hidalgo. All rights reserved.
//

import Foundation

struct PiDeliveryResponse: Codable {
  let content: String?
}

protocol PiDeliveryStoreProtocol {

  func getPiNumbers(start: Int,
                    numberOfDigits: Int,
                    completion: @escaping(PiDeliveryStoreResult<PiDeliveryResponse>) -> Void)
}

enum PiDeliveryStoreResult<U> {
  case success(result: U)
  case failure(error: PiDeliveryStoreError)
}

enum PiDeliveryStoreError: Error {
  case timeOut
  case noInternet
  case unauthorized
  case unknownError

  var message: String {
    switch self {
    case .noInternet:
      return Constants.Literals.Errors.noConnection
    case .timeOut:
      return Constants.Literals.Errors.timeOut
    case .unauthorized:
      return Constants.Literals.Errors.unauthorized
    case .unknownError:
      return Constants.Literals.Errors.unknownError
    }
  }
}

class PiDeliveryStore: PiDeliveryStoreProtocol {

  func getPiNumbers(start: Int,
                    numberOfDigits: Int,
                    completion: @escaping (PiDeliveryStoreResult<PiDeliveryResponse>) -> Void) {

    let request = PiDeliveryRouter.getPiDigits(start: start, numberOfDigits: numberOfDigits)

    Network.sessionManager.request(request).validate().responseJSON { (response) in
      switch response.result {
      case .success:
        guard let data = response.data else { return }
        do {
          let piData = try JSONDecoder().decode(PiDeliveryResponse.self, from: data)
          completion(.success(result: piData))
        } catch {
          completion(.failure(error: .unknownError))
        }

      case .failure:
        completion(.failure(error: .unknownError))
      }
    }
  }

}
