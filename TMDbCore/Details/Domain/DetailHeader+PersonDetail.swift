//
//  DetailHeader+PersonDetail.swift
//  TMDbCore
//
//  Created by Sergio Marrero Fernandez on 10/14/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(person: PersonDetail, dateFormatter: DateFormatter) {
        title = person.name
        posterPath = person.profilePath
        
        if let taggedImages = person.taggedImages {
            if taggedImages.results.count > 0 {
                switch taggedImages.results[0].media {
                case .movie(let movie):
                    backdropPath = movie.backdropPath
                case .show(let show):
                    backdropPath = show.backdropPath
                }
            } else {
                backdropPath = nil
            }
        } else {
            backdropPath = nil
        }
        
        metadata = [person.birthDay, person.deathDay].flatMap { $0 }.joined(separator: " - ")
    }
}
