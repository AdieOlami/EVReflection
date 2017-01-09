//
//  Observable+EVReflectable.swift
//
//  Created by Edwin Vermeer on 06/01/17.
//  Copyright © 2017 Edwin Vermeer. All rights reserved.
//

import Foundation
import RxSwift
import Moya

/// Extension for processing Responses into Mappable objects through ObjectMapper
public extension ObservableType where E == Response {

  /// Maps data received from the signal into an object
  /// which implements the Mappable protocol and returns the result back
  /// If the conversion fails, the signal errors.
  public func map<T: EVReflectable>(to type: T.Type) -> Observable<T> where T: NSObject {
    return flatMap { response -> Observable<T> in
        return Observable.just(try response.map(to: T.self))
      }
  }

  /// Maps data received from the signal into an array of objects
  /// which implement the Mappable protocol and returns the result back
  /// If the conversion fails, the signal errors.
  public func map<T: EVReflectable>(toArray type: T.Type) -> Observable<[T]>  where T: NSObject {
    return flatMap { response -> Observable<[T]> in
        return Observable.just(try response.map(toArray: T.self))
      }
  }
}
