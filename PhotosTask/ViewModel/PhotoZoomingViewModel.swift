//
//  PhotoZoomingViewModel.swift
//  PhotosTask
//
//  Created by kariman eltawel on 27/01/2024.
//

import Foundation

class PhotoZoomingViewModel{
    var PhotoUrl:String
    
    init(photo: Photo) {
        self.PhotoUrl = photo.url ?? ""
    }

}
