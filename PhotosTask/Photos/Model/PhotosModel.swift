//
//  PhotosModel.swift
//  PhotosTask
//
//  Created by kariman eltawel on 27/01/2024.
//

import Foundation

// MARK: - Photo
struct Photo: Codable {
    var albumID, id: Int?
    var title: String?
    var url, thumbnailURL: String?
    
    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
