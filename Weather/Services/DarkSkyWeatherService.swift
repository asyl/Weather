//
//  DarkSkyWeatherService.swift
//  Weather
//
//  Created by Asyl Isakov on 2017/08/19.
//  Copyright © 2017年 asyl. All rights reserved.
//

import RxSwift
import ObjectMapper

protocol DarkSkyWeatherServiceType {
  func forecast(latitude: Double, longitude: Double) -> Observable<DarkSkyWeather>
}

class DarkSkyWeatherService: DarkSkyWeatherServiceType {
  
  let networking = Networking<DarkSkyAPI>()
  
  internal func forecast(latitude: Double, longitude: Double) -> Observable<DarkSkyWeather> {
    return networking.request(.forecast(latitude: latitude, longitude: longitude)).map(DarkSkyWeather.self)
  }
  
}
