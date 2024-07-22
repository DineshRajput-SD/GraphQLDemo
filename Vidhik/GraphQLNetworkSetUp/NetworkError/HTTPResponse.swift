//
//  HTTPResponse.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 08/04/24.
//

import Foundation
import UIKit

// MARK: - Enum of NetworkResponse Type
public enum NetworkError: Error {
  case success
  case autehenticationError
  case badRequest
  case outDated
  case failed
  case noData
  case unableToDecode
  case noInternetConnection
  case apiFailed
  case appUpdate
  case other(message: String)
}

extension NetworkError: LocalizedError {
  public var errorDescription: String? {
    switch self {
    case .success:
      return ""
    case .autehenticationError:
      return "You need to be authenticated first"
    case .badRequest:
      return "Bad request"
    case .outDated:
      return "The url you requested is outdated"
    case .failed:
      return "Network request failed"
    case .noData:
      return "Response returned with no data to decode"
    case .unableToDecode:
      return "We could not decode the response"
    case .noInternetConnection:
      return "Slow or no internet connection.\nPlease check your internet connection"
    case .apiFailed:
      return "Something went wrong, please try again later"
    case .appUpdate:
      return "Please update your app."
      
    case let .other(message):
      return message
    }
  }
}



public func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<Bool, Error> {
    switch response.statusCode {
    case 200...299:
      return Result.success(true)
      
    case 401:
      URLSession.shared.getAllTasks { (allTasks) in
        allTasks.forEach { $0.cancel() }
      }
      AlertView.show(title: "Your session has expired", message: "Your session has expired", okTitle: "Ok", cancelTitle: nil) { _ in
          UIApplication.getTopViewController()?.navigationController?.pushVC(LoginViewController())
      }
      return Result.failure(NetworkError.autehenticationError)
      
    case 400, 422:
      return Result.success(true)
      
    case 403:
      return Result.failure(NetworkError.appUpdate)
      
    case 402...500:
      return Result.failure(NetworkError.failed)
      
    case 501...599:
      return Result.failure(NetworkError.badRequest)
      
    case 600:
      return Result.failure(NetworkError.outDated)
      
    default:
      return Result.failure(NetworkError.failed)
    }
  }
