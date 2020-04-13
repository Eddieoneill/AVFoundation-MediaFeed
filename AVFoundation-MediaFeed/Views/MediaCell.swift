//
//  MediaCell.swift
//  AVFoundation-MediaFeed
//
//  Created by Edward O'Neill on 4/13/20.
//  Copyright © 2020 Edward O'Neill. All rights reserved.
//

import UIKit

class MediaCell: UICollectionViewCell {
    
    @IBOutlet weak var mediaImageView: UIImageView!
    
    public func congigureCell(for mediaObject: MediaObject) {
        if let imageData = mediaObject.imageData {
            mediaImageView.image = UIImage(data: imageData)
        } else if let videoURL = mediaObject.videoURL {
            let image = videoURL.videoPreviewThumbnail() ?? UIImage(systemName: "heart")
            mediaImageView.image = image
        }
    }
    
}
