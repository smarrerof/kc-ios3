//
//  TaggedImage.swift
//  TMDbCore
//
//  Created by Sergio Marrero Fernandez on 10/14/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct TaggedImage: Decodable {
    let aspectRatio: Float
    let mediaType: String
    let media: Media
    
    private enum CodingKeys: String, CodingKey {
        case aspectRatio = "aspect_ratio"
        case mediaType = "media_type"
        case media
    }
        
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.aspectRatio = try container.decode(Float.self, forKey: .aspectRatio)
        self.mediaType = try container.decode(String.self, forKey: .mediaType)
        
        switch mediaType {
        case "movie":
            self.media = try .movie(container.decode(Movie.self, forKey: .media))
        case "tv":
            self.media = try .show(container.decode(Show.self, forKey: .media))
        default:
            let context = DecodingError.Context(codingPath: [CodingKeys.mediaType],
                                                debugDescription: "Unknown media type: \(mediaType)")
            throw DecodingError.dataCorrupted(context)
        }
    }
}
