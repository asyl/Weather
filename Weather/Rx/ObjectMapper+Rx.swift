//
//  ObjectMapper+Rx.swift
//  Weather
//
//  Created by Asyl Isakov on 2017/08/19.
//  Copyright © 2017年 asyl. All rights reserved.
//

import Moya
import ObjectMapper
import RxSwift

extension ObservableType where E == Moya.Response {

  func map<T: ImmutableMappable>(_ mappableType: T.Type) -> Observable<T> {
    return self.mapString()
      .map { jsonString -> T in
        return try Mapper<T>().map(JSONString: jsonString)
      }
      .do(onError: { error in
        if error is MapError {
          log.error(error)
        }
      })
  }
  
  func map<T: ImmutableMappable>(_ mappableType: [T].Type) -> Observable<[T]> {
    return self.mapString()
      .map { jsonString -> [T] in
        return try Mapper<T>().mapArray(JSONString: jsonString)
      }
      .do(onError: { error in
        if error is MapError {
          log.error(error)
        }
      })
  }
  
}


