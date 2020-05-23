//
//  AccessTokenAdapter.swift
//  piRainbow
//
//  Created by Antonio Gonzalez Hidalgo on 23/05/2020.
//  Copyright © 2020 Antonio Gonzalez Hidalgo. All rights reserved.
//

import Alamofire

class AccessTokenAdapter: RequestAdapter {

  func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
    return urlRequest
  }

}
