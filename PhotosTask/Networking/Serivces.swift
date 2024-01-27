//
//  Serivces.swift
//  PhotosTask
//
//  Created by kariman eltawel on 26/01/2024.
//

import Foundation
import UIKit
import Alamofire

class NetworkCall {
    static let shared = NetworkCall()
    private init() {}
    
    func getPhotos(pageNum:Int,limit:Int,controller:UIViewController,completion :@escaping (Result<[Photo]?,Error>) -> Void) {
        
        Request.request(vc: controller, url: URLs.Instance.getPhotos(pageNum: pageNum, limit: limit), method: .get, parameters: nil, encoding:  URLEncoding.default, headers: nil, callBack: completion)
    }
    
}
