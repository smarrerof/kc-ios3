//
//  TaggedImage.swift
//  TMDbCore
//
//  Created by Sergio Marrero Fernandez on 10/14/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct TaggedImage: Decodable {
    struct Media: Decodable {
        let posterPath: String?
        let identifier: Int64
        let title: String
        let backdropPath: String?
        let popularity: Float?
        
        private enum CodingKeys: String, CodingKey {
            case posterPath = "poster_path"
            case identifier = "id"
            case title
            case backdropPath = "backdrop_path"
            case popularity
        }
    }
    
    let aspectRatio: Float
    let mediaType: String
    let media: Media
    
    private enum CodingKeys: String, CodingKey {
        case aspectRatio = "aspect_ratio"
        case mediaType = "media_type"
        case media
    }
}
