//
//  MediaObject.swift
//  AVFoundation-MediaFeed
//
//  Created by Edward O'Neill on 4/13/20.
//  Copyright © 2020 Edward O'Neill. All rights reserved.
//

import Foundation

// medeaObject instance can either be a video or image content
struct MediaObject {
    let imageData: Data?
    let videoURL: URL?
    let caption: String? // UI so user can enter text
    let id = UUID().uuidString
    let createdDate = Date()
}
