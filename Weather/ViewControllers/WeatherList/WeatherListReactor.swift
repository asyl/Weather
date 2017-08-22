//
//  WeatherListReactor.swift
//  Weather
//
//  Created by Asyl Isakov on 2017/08/21.
//  Copyright © 2017年 asyl. All rights reserved.
//

import ReactorKit
import RxSwift

final class WeatherListReactor: Reactor {
  
  init(weatherService: DarkSkyWeatherServiceType) {
    self.weatherService = weatherService
  }
  
  enum Action {
    case refresh
  }
  
  enum Mutation {
    case setRefreshing(Bool)
    case setWeathers([DarkSkyWeather])
  }
  
  struct State {
    var isRefreshing = false
  }
  
  let initialState = State()
  
  fileprivate var weatherService: DarkSkyWeatherServiceType
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .refresh:
      guard !self.currentState.isRefreshing else { return .empty() }
      let startRefreshing = Observable<Mutation>.just(.setRefreshing(true))
      let endRefreshing = Observable<Mutation>.just(.setRefreshing(false))
      return .concat([startRefreshing, endRefreshing])
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case let .setRefreshing(isRefreshing):
      state.isRefreshing = isRefreshing
      return state
    case .setWeathers:
      return state
    }
  }
  
}
