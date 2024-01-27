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
        viewModel.getPhotos(controller: self)
    }
    
    func registerCells(){
        photosTable.register(PhotosTableViewCell.register(), forCellReuseIdentifier:PhotosTableViewCell.identifier)
    }
    
    func BindViewModel(){
        viewModel.isLoadingData.bind { [weak self] isLoading in
            guard let loading = isLoading else{
                return
            }
            DispatchQueue.main.async{
                if loading {
                    self?.activityIndicator.startAnimating()
                }
                else{
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] photos in
            guard let photos = photos else{
                return
            }
            
            self?.PhotosData = photos
            self?.tableReload()
        }
        
    }
    
    
    func tableReload(){
        DispatchQueue.main.async{
            self.photosTable.reloadData()
        }
    }
    
}
