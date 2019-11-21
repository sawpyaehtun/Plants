//
//  NetworkClient.swift
//  The Movie App
//
//  Created by saw pyaehtun on 08/09/2019.
//  Copyright © 2019 Ye Ko Ko Htet. All rights reserved.
//

import Foundation
import Alamofire
import Reachability
import SystemConfiguration
import SwiftyJSON
import RxSwift


class NetworkClient {
    //MARK:- NETWORK CALLS
    static let shared = NetworkClient()
    
    private let APIManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        let delegate = SessionManager.default.delegate
        let manager = SessionManager.init(configuration: configuration,
                                          delegate: delegate)
        return manager
    }()
    
    public func request(url : String,
                        method : HTTPMethod = .get,
                        parameters : Parameters = [:],
                        headers : HTTPHeaders = [:]) -> Observable<Any?>{
        
        print("url . . . : \(url)")
        
        let encoding : ParameterEncoding = (method == .get ? URLEncoding.default : JSONEncoding.default)
        
        return Observable<Any?>.create{ (observer)-> Disposable in
            

            let request = self.APIManager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseData { (response) in
                switch response.result {
                case .success(let data) :
                   if 200 ... 299 ~= response.response?.statusCode ?? 500 {
                        observer.onNext(data)
                        observer.onCompleted()
                    }
//                    } else {
//                        let error = try! JSONDecoder().decode(ErrorResponse.self, from: response.data!)
//                        observer.onError(NSError(domain: error.message ?? "", code: error.code ?? 500, userInfo: nil))
//                    }
                case .failure(let err) :
                   observer.onError(err)
                }
            }
            
            return Disposables.create(with: {
                request.cancel()    //close request
            })
            
        }
        
    }
    
    
    func getDataWithUrlSession(url : String, success : @escaping (Data) -> Void,
                               failure : @escaping (String) -> Void) {
        
        let route = URL(string: url)
        print("route !!!! \(route)")
        URLSession.shared.dataTask(with: route!) { (data, urlresponse, error) in
            if let data = data  {
                success(data)
            } else {
                failure(error!.localizedDescription)
            }
        }.resume()
    }
    
}
