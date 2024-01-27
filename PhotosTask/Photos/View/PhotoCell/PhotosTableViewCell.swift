//
//  PhotosTableViewCell.swift
//  PhotosTask
//
//  Created by kariman eltawel on 27/01/2024.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    //MARK: -IBOutlet-
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    @IBOutlet weak var containerView: UIView!

    static var identifier: String {
        get {
            "PhotosTableViewCell"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.round()
        containerView.addBorder(color: .lightGray, width: 1)
    }
    
    static func register() -> UINib {
        UINib(nibName: "PhotosTableViewCell", bundle: nil)
    }
    
    func setUpPhotoCell(photoCell:photosCellViewModel){
        photo.cacheImage(urlString:photoCell.imageUrl ?? "")
        photoTitle.text = photoCell.title
    }
}
