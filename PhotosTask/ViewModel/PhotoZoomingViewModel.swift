//
//  PhotoZoomingViewModel.swift
//  PhotosTask
//
//  Created by kariman eltawel on 27/01/2024.
//

import Foundation

class PhotoZoomingViewModel{
    
    var photo:URL?
    
    init(photo: Photo) {
        self.photo =  URL(string: photo.url ?? "" )
    }

}
