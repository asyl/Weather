//
//  AppDelegate.swift
//  Weather
//
//  Created by Asyl Isakov on 2017/08/18.
//  Copyright © 2017年 asyl. All rights reserved.
//

import UIKit
import CoreData

import GooglePlaces
import GoogleMaps
import SwiftyColor
import Then
import RxViewController


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    self.configureGoogleSDK()
    self.configureAppearance()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = UIColor.wt_charcoal
    let darkSkyService = DarkSkyWeatherService()
    let weatherReactor = WeatherListReactor(weatherService: darkSkyService)
    window?.rootViewController = WeatherListController(reactor: weatherReactor)
    return true
  }
  
  // uncomment & put your Google API key here:
  // let googleApiKey = ""
  
  /// Configure GooglePlaces & GoogleMaps
  func configureGoogleSDK(){
    GMSPlacesClient.provideAPIKey(googleApiKey)
    GMSServices.provideAPIKey(googleApiKey)
  }
  
  // MARK: Appearance
  
  private func configureAppearance() {
    
  }

 
}

