//
//  photosCellViewModel.swift
//  PhotosTask
//
//  Created by kariman eltawel on 27/01/2024.
//

import Foundation

class photosCellViewModel{
    var title: String?
    var image: URL?
    
    init(photo: Photo) {
        self.title = "\(photo.title ?? "")"
        self.image =  URL(string: photo.url ?? "" )
    }
    
}
