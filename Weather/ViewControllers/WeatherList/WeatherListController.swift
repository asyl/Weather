//
//  ViewController.swift
//  Weather
//
//  Created by Asyl Isakov on 2017/08/18.
//  Copyright © 2017年 asyl. All rights reserved.
//

import UIKit
import GooglePlaces
import RxSwift
import RxCocoa
import ReactorKit

class WeatherListController: UIViewController, View {
  
  /// A dispose bag. It is disposed each time the `reactor` is assigned.
  var disposeBag = DisposeBag()

  init(reactor: WeatherListReactor) {
    defer { self.reactor = reactor }
    super.init(nibName: nil, bundle: nil)
  }
  
  required convenience init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func bind(reactor: WeatherListReactor) {
    
    // action : View -> Reactor
    
    self.rx.viewDidLoad
      .map { Reactor.Action.refresh }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
    
    
    // state : Reactor -> View
    
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
