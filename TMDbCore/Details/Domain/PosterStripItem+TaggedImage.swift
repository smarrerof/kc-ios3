//
//  PosterStripItem+TaggedImage.swift
//  TMDbCore
//
//  Created by Sergio Marrero Fernandez on 10/14/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension PosterStripItem {
    init(media: TaggedImage.Media) {
        identifier = media.identifier
        mediaType = .movie
        title = media.title
        metadata = media.title
        posterPath = media.backdropPath
    }
}
