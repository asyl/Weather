//
//  ViewController.swift
//  Weather
//
//  Created by Asyl Isakov on 2017/08/18.
//  Copyright © 2017年 asyl. All rights reserved.
//

import UIKit
import GooglePlaces

class WeatherListController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}

extension WeatherListController: GMSAutocompleteViewControllerDelegate {
  
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
    
  }
  
  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    
  }
  
  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    
  }
  
  func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    
  }
  
  func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    
  }

}
