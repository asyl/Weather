//
//  Networking.swift
//  Weather
//
//  Created by Asyl Isakov on 2017/08/18.
//  Copyright © 2017年 asyl. All rights reserved.
//

import Moya
import MoyaSugar
import RxSwift

final class Networking<Target: SugarTargetType> : RxMoyaSugarProvider<Target> {

  init() {
    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = Manager.defaultHTTPHeaders
    configuration.timeoutIntervalForRequest = 10
    
    let manager = Manager(configuration: configuration)
    manager.startRequestsImmediately = false
    super.init(manager: manager)
  }
  
  @available(*, unavailable)
  override func request(_ token: Target) -> Observable<Response> {
    return super.request(token)
  }
  
  func request(
    _ token: Target,
    file: StaticString = #file,
    function: StaticString = #function,
    line: UInt = #line
    ) -> Observable<Response> {
    let requestString = "\(token.method) \(token.path)"
    return super.request(token)
      .filterSuccessfulStatusCodes()
      .do(
        onNext: { value in
          let message = "SUCCESS: \(requestString) (\(value.statusCode))"
          log.debug(message, file: file, function: function, line: line)
      },
        onError: { error in
          if let response = (error as? MoyaError)?.response {
            if let jsonObject = try? response.mapJSON(failsOnEmptyData: false) {
              let message = "FAILURE: \(requestString) (\(response.statusCode))\n\(jsonObject)"
              log.warning(message, file: file, function: function, line: line)
            } else if let rawString = String(data: response.data, encoding: .utf8) {
              let message = "FAILURE: \(requestString) (\(response.statusCode))\n\(rawString)"
              log.warning(message, file: file, function: function, line: line)
            } else {
              let message = "FAILURE: \(requestString) (\(response.statusCode))"
              log.warning(message, file: file, function: function, line: line)
            }
          } else {
            let message = "FAILURE: \(requestString)\n\(error)"
            log.warning(message, file: file, function: function, line: line)
          }
      },
        onSubscribe: {
          let message = "REQUEST: \(requestString)"
          log.debug(message, file: file, function: function, line: line)
      }
    )
  }


}
