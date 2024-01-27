//
//  PhotosViewController+Helper.swift
//  PhotosTask
//
//  Created by kariman eltawel on 27/01/2024.
//

import Foundation

extension PhotosViewController{
    //MARK: - REGISTER CELL FOR TABLE
    func registerCells(){
        photosTable.register(PhotosTableViewCell.register(), forCellReuseIdentifier:PhotosTableViewCell.identifier)
    }
    //MARK: - NOTIFY WHEN CHANGE HAPPENED
    func bindViewModel(){
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
            
            self?.photosData = photos
            self?.tableReload()
        }
    }
    //MARK: - RELOAD TABLE
    func tableReload(){
        DispatchQueue.main.async{
            self.photosTable.reloadData()
        }
    }
    //MARK: - NAVIGATION To ZOOM VIEW
    func openZoom(photo:Photo) {
        guard let photo = viewModel.retrivePhoto(photo: photo) else {
            return
        }
        
        DispatchQueue.main.async {
            let photoZoomViewModel = PhotoZoomingViewModel(photo: photo)
            let controller = PhotoZoomingViewController(viewModel: photoZoomViewModel)
            controller.modalPresentationStyle = .fullScreen
            self.navigationController?.present(controller, animated: true)
        }
    }
}
