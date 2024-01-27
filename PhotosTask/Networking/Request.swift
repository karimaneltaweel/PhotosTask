//
//  Request.swift
//  PhotosTask
//
//  Created by kariman eltawel on 26/01/2024.
//
import Foundation
import UIKit
import Alamofire
import NVActivityIndicatorView

class Request {
    
    class func request<T: Codable>(url: String, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders?, callBack:@escaping (Result<T, Error>) -> Void) {
            
            let jsonDecodeer = JSONDecoder()
            
            print(url)
            URLCache.shared.removeAllCachedResponses()
            
            AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).validate().responseDecodable(of: T.self) { (response) in
                print(response.result)
                print(response.data)
                print(response)
                print(response.response)
                switch response.result {
                case .success:
                    if let _ = response.data {
                        guard let resultData = response.data else { fatalError() }
                        do {
                            
                            let basicResponse = try jsonDecodeer.decode(T.self, from: resultData)
                            print(basicResponse)
                            callBack(.success(basicResponse))
                        }
                        catch(let error) {
                            print(error.localizedDescription)
                            callBack(.failure(error))
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    callBack(.failure(error))
                }
            }
        }
}
