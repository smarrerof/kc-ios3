//
//  ShowDetail.swift
//  TMDbCore
//
//  Created by Sergio Marrero Fernandez on 10/17/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct ShowDetail: Decodable {
    let backdropPath: String?
    let identifier: Int64
    let firstAirDate: String?
    let lastAirDate: String?
    let name: String
    let overview: String?
    let posterPath: String?
    let credits: Credits?
    
    private enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case identifier = "id"
        case firstAirDate = "first_air_date"
        case lastAirDate = "last_air_date"
        case name
        case overview
        case posterPath = "poster_path"
        case credits
    }
}
