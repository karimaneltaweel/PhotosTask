//
//  PhotosViewController.swift
//  PhotosTask
//
//  Created by kariman eltawel on 26/01/2024.
//

import UIKit

class PhotosViewController: UIViewController {

    //----IBOutlet:
    @IBOutlet weak var photosTable: UITableView!{
        didSet{
            registerCells()
        }
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    //--------viewModel
    var viewModel:PhotosViewModel = PhotosViewModel()
    //------------data
    var PhotosData:[photosCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getPhotos()
    }
}
