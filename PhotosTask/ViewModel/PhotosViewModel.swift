//
//  PhotosViewModel.swift
//  PhotosTask
//
//  Created by kariman eltawel on 26/01/2024.
//

import Foundation

class PhotosViewModel{
    
    private let totalPhotos = 5000
    //------binding----
    var isLoadingData:Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[photosCellViewModel]> = Observable(nil)
    var dataSource:[Photo]?
    private var PageNum = 1
    //--------------------
    func numberOfSections() -> Int{
        1
    }
    
    func numberOfRows(in sections:Int) -> Int{
        cellDataSource.value?.count ?? 0
    }
    
    
    func getPhotos() {
        if  isLoadingData.value ?? true {
            //-----data--is---loading--data has't arrived
            return
        }
        isLoadingData.value = true
        
        NetworkCall.shared.getPhotos(pageNum:PageNum) { [weak self] result in
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
        if PageNum == 1 {
            self.cellDataSource.value = self.dataSource?.compactMap({photosCellViewModel(photo:$0)})
        }
        else{
            self.cellDataSource.value? += self.dataSource?.compactMap({photosCellViewModel(photo:$0)}) ?? []
        }
      }
    
    
    func pagination(indexPath:Int){
        guard  dataSource?.count != 0 else {
            // Data is empty or nil
            return
        }
        if indexPath == (cellDataSource.value?.count ?? 0) - 1 {
            if cellDataSource.value?.count ?? 0 < totalPhotos {
                PageNum += 1
                getPhotos()
            }
        }
    }
    
    func retrivePhoto(photo: Photo) -> Photo? {
          return photo
      }
}
