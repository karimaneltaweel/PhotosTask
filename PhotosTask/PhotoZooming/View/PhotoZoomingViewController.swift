//
//  PhotoZooomingViewController.swift
//  PhotosTask
//
//  Created by kariman eltawel on 27/01/2024.
//

import UIKit

class PhotoZoomingViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    //MARK: -View model
    var viewModel: PhotoZoomingViewModel
    
    init(viewModel: PhotoZoomingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PhotoZoomingViewController", bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurScroll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configView()
    }
    
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func configView() {
        img.cacheImage(urlString:viewModel.photoUrl)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return img
    }
    
    
    func configurScroll(){
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        scrollView.delegate = self
    }
}
