//
//  PiDeliveryRouter.swift
//  piRainbow
//
//  Created by Antonio Gonzalez Hidalgo on 23/05/2020.
//  Copyright © 2020 Antonio Gonzalez Hidalgo. All rights reserved.
//

import Alamofire

enum PiDeliveryRouter: URLRequestConvertible {

  case getPiDigits(start: Int, numberOfDigits: Int)

  static let baseURLString = "https://api.pi.delivery"

  var method: HTTPMethod {
    switch self {
    case .getPiDigits:
      return .get
    }
  }

  var path: String {
    switch self {
    case .getPiDigits:
      return "/v1/pi"
    }
  }

  // MARK: URLRequestConvertible

  func asURLRequest() throws -> URLRequest {

    let url = try PiDeliveryRouter.baseURLString.asURL()

    var urlRequest = URLRequest(url: url.appendingPathComponent(path))
    urlRequest.httpMethod = method.rawValue
    urlRequest.cachePolicy = .returnCacheDataElseLoad

    switch self {
    case .getPiDigits(start: let start, numberOfDigits: let numberOfDigits):
      urlRequest = try URLEncoding.default.encode(urlRequest, with: ["start": start,
                                                                     "numberOfDigits": numberOfDigits])
    }
    return urlRequest
  }

}
