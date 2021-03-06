//
//  URL+VideoPlayerThumbnail.swift
//  AVFoundation-MediaFeed
//
//  Created by Edward O'Neill on 4/13/20.
//  Copyright © 2020 Edward O'Neill. All rights reserved.
//

import UIKit
import AVFoundation
 
extension URL {
    public func videoPreviewThumbnail() -> UIImage? {
        // create an AVAsset instance
        // e.g let image = mediaObject.videoURL.videoPreviewThumbnail()
        let asset = AVAsset(url: self) // self is the URL instance
        
        // The AVAssetImageGenerator is an AVFoundation class that converts a given media url to an image
        let assetGenerator = AVAssetImageGenerator(asset: asset)
        
        // we want tot maintain the aspect ratio of the video
        assetGenerator.appliesPreferredTrackTransform = true
        
        // create a time stamp of needed location in the video
        // we will use a CMTime to generate the given time stamp
        // CMTime is part of Core Media
        let timestamp = CMTime(seconds: 1, preferredTimescale: 60)
        // retrive the first second of the video
        
        var image: UIImage?
        
        do {
            let cgImage = try assetGenerator.copyCGImage(at: timestamp, actualTime: nil)
            image = UIImage(cgImage: cgImage)
            
            // UIView
            // Layer
            
            // lower level API don't know about UIKit, AVKit
            // change the color of a UIView boarder
            // e.g someView.layer.boarderColor = UIColor.green.cgColor
        } catch {
            print("failed to generate image \(error)")
        }
        return image
    }
}
