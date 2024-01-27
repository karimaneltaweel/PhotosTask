//
//  photosCellViewModel.swift
//  PhotosTask
//
//  Created by kariman eltawel on 27/01/2024.
//

import Foundation

class photosCellViewModel{
    var photoData: Photo

    var title: String?
    var image: URL?
    var id:Int?
    
    init(photo: Photo) {
        self.photoData = photo
        self.title =  "\(photo.title ?? "")"
        self.id = photo.id
        self.image =  URL(string: photo.url ?? "" )
    }
    
}
