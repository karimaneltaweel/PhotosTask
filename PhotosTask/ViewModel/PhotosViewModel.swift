//
//  PhotosViewModel.swift
//  PhotosTask
//
//  Created by kariman eltawel on 26/01/2024.
//

import Foundation
import UIKit

class PhotosViewModel{
    
    private let totalPhotos = 5000
    //------binding----
    var isLoadingData:Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[photosCellViewModel]> = Observable(nil)
    var dataSource:[Photo]?
    //--------------------
    func numberOfSections() -> Int{
        1
    }
    
    func numberOfRows(in sections:Int) -> Int{
        dataSource?.count ?? 0
    }
    
    
    func getPhotos(controller:UIViewController,pageNum:Int,limit:Int) {
        if  isLoadingData.value ?? true {
            //-----data--is---loading--data has't arrived
            return
        }
        isLoadingData.value = true
        
        NetworkCall.shared.getPhotos(pageNum: pageNum, limit: limit, controller:controller) { [weak self] result in
            //----------data has arrived and have to switch the value
            self?.isLoadingData.value = false
            switch result {
            case .success(let data):
                self?.dataSource = data
                self?.mapPhotoData()
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    private func mapPhotoData() {
        cellDataSource.value = self.dataSource?.compactMap({photosCellViewModel(photo:$0)})
      }
    
}
