//
//  Urls.swift
//  PhotosTask
//
//  Created by kariman eltawel on 26/01/2024.
//

import Foundation
class URLs {
    
    static let Instance = URLs()
    private init() {}
    
    let url = "https://jsonplaceholder.typicode.com"
    
    func getPhotos(pageNum:Int,limit:Int) -> String {
        url + "/photos?_page=\(pageNum)&_limit=\(limit)"
    }
    
}
