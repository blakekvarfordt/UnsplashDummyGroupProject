//
//  UnsplashPhotoCell.swift
//  DummyProjectUnsplash
//
//  Created by Blake kvarfordt on 10/1/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class UnsplashPhotoCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    var photo: UnsplashPhoto? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else { return }
        fetchImage(photo: photo)
    }
    
    func fetchImage(photo: UnsplashPhoto) {
        UnsplashService.shared.fetchImage(for: photo) { (image) in
            DispatchQueue.main.async {
                self.photoImageView.image = image
            }
        }
    }
}
