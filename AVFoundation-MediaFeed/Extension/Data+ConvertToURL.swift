//
//  File.swift
//  AVFoundation-MediaFeed
//
//  Created by Edward O'Neill on 4/15/20.
//  Copyright © 2020 Edward O'Neill. All rights reserved.
//

import Foundation

extension Data {
    // use case example:
    // let url = mediaObject.videoData.convertToURL()
    public func convertToURL() -> URL? {
        // create a temporary URL
        // NSTemporaryDirectory() - stores temporary files, those files get deketed as needed by the operating system
        // documents directory is for permanent storage
        // caches directory is temporary storage
        
        // in CoreData the video is saved as Data
        // AVPlayer need a URL pointing topa location on disk
        let tempURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("video").appendingPathExtension("mp4")
        
        do {
            try self.write(to: tempURL, options: [.atomic])
            return tempURL
        } catch {
            print("failed to write video data to temporary file with error: \(error)")
        }
        return nil
    }
}
