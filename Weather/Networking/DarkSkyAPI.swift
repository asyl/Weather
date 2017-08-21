//
//  DarkSkyAPI.swift
//  Weather
//
//  Created by Asyl Isakov on 2017/08/18.
//  Copyright © 2017年 asyl. All rights reserved.
//

import Moya
import MoyaSugar

enum DarkSkyAPI {
  case forecast(latitude: Double, longitude: Double)
}

// uncomment & put your DarkSky secret key here:
// let darkSkyApiKey = ""

extension DarkSkyAPI: SugarTargetType {
  
  var baseURL: URL {
    return URL(string: "https://api.darksky.net")!
  }
  
  var route: Route {
    switch self {
    case let .forecast(latitude, longitude):
      return .get("/forecast/\(darkSkyApiKey)/\(latitude),\(longitude)")
    }
  }
  
  var params: Parameters? {
    switch self {
    case .forecast:
      var params = Parameters()
      params.values["units"] = "si"
      return params
    }
  }
  
  var task: Task {
    switch self {
    default:
      return .request
    }
  }
  
  public var sampleData: Data {
    return Data()
  }
  

}
