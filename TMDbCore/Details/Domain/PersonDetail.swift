//
//  PersonDetail.swift
//  TMDbCore
//
//  Created by Sergio Marrero Fernandez on 10/14/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct PersonDetail: Decodable {
    let identifier: Int64
    let biography: String?
    let birthDay: String?
    let deathDay: String?
    let name: String
    let profilePath: String?
    let taggedImages: Page<TaggedImage>?
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case biography
        case birthDay = "birthday"
        case deathDay = "deathday"
        case name
        case profilePath = "profile_path"
        case taggedImages = "tagged_images"
    }
}
