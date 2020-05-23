//
//  Network.swift
//  piRainbow
//
//  Created by Antonio Gonzalez Hidalgo on 23/05/2020.
//  Copyright © 2020 Antonio Gonzalez Hidalgo. All rights reserved.
//

import Alamofire

final class Network {

  static let sessionManager: SessionManager = {

    let configuration = URLSessionConfiguration.default
    configuration.timeoutIntervalForRequest = Constants.Network.timeOut
    configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData

    var manager = SessionManager(configuration: configuration)
    manager.adapter = AccessTokenAdapter()
    return manager
  }()

}
