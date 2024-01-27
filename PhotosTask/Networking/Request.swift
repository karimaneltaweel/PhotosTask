//
//  Request.swift
//  PhotosTask
//
//  Created by kariman eltawel on 26/01/2024.
//
import Foundation
import UIKit
import Alamofire

class Request {
    
    class func request<T: Codable>(url: String, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders?, callBack:@escaping (Result<T, Error>) -> Void) {
            
            let jsonDecodeer = JSONDecoder()
            
            URLCache.shared.removeAllCachedResponses()
            
            AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).validate().responseDecodable(of: T.self) { (response) in
                switch response.result {
                case .success:
                    if let _ = response.data {
                        guard let resultData = response.data else { fatalError() }
                        do {
                            
                            let basicResponse = try jsonDecodeer.decode(T.self, from: resultData)
                            callBack(.success(basicResponse))
                        }
                        catch(let error) {
                            callBack(.failure(error))
                        }
                    }
                case .failure(let error):
                    callBack(.failure(error))
                }
            }
        }
}
