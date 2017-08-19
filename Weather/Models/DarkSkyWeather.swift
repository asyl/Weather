//
//  DarkSkyWeatherModel.swift
//  Weather
//
//  Created by Asyl Isakov on 2017/08/19.
//  Copyright © 2017年 asyl. All rights reserved.
//

import ObjectMapper

struct DarkSkyWeather: ModelType {

  let latitude: Double
  let longitude: Double
  let timezone: String
  let currently: DarkSkyWeatherElement?

  init(map: Map) throws {
    latitude = try map.value("latitude")
    longitude = try map.value("longitude")
    timezone = try map.value("timezone")
    currently = try? map.value("currently")
  }

}

struct DarkSkyWeatherElement: ModelType {

  let time: Int?
  let summary: String?
  let icon: String?
  let precipIntensity: Double?
  let precipProbability: Double?
  let temperature: Double?
  let apparentTemperature: Double?
  let dewPoint: Double?
  let humidity: Double?
  let windSpeed: Double?
  let windGust: Double?
  let windBearing: Int?
  let visibility: Double?
  let cloudCover: Double?
  let pressure: Double?
  let ozone: Double?
  let uvIndex: Int?

  init(map: Map) throws {
    time = try? map.value("time")
    summary = try? map.value("summary")
    icon = try? map.value("icon")
    precipIntensity = try? map.value("precipIntensity")
    precipProbability = try? map.value("precipIntensity")
    temperature = try? map.value("temperature")
    apparentTemperature = try? map.value("apparentTemperature")
    dewPoint = try? map.value("dewPoint")
    humidity = try? map.value("humidity")
    windSpeed = try? map.value("windSpeed")
    windGust = try? map.value("windGust")
    windBearing = try? map.value("windBearing")
    visibility = try? map.value("visibility")
    cloudCover = try? map.value("cloudCover")
    pressure = try? map.value("pressure")
    ozone = try? map.value("ozone")
    uvIndex = try? map.value("uvIndex")
  }
  
}
