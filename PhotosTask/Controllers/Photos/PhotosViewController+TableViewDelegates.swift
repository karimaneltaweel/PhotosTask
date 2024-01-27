//
//  PhotosViewController+TableViewDelegates.swift
//  PhotosTask
//
//  Created by kariman eltawel on 26/01/2024.
//

import Foundation
import UIKit

extension PhotosViewController:UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in:section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as? PhotosTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setUpPhotoCell(photoCell:PhotosData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.pagination(indexPath: indexPath.row)

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photoId = PhotosData[indexPath.row].id ?? 0
        self.openDetails(photoId:photoId)
      }
    
}
