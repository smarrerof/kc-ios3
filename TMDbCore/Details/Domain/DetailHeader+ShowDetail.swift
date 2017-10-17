//
//  DetailHeader+ShowDetail.swift
//  TMDbCore
//
//  Created by Sergio Marrero Fernandez on 10/17/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(show: ShowDetail, dateFormatter: DateFormatter) {
        title = show.name
        posterPath = show.posterPath
        backdropPath = show.backdropPath
        
        let firstAirDate = show.firstAirDate.flatMap { dateFormatter.date(from: $0)}
        let firstAirDateYear = (firstAirDate?.year).map { String($0) }
        let lastAirDate = show.lastAirDate.flatMap { dateFormatter.date(from: $0)}
        let lastAirDateYear = (lastAirDate?.year).map { String($0) }
        
        metadata = [firstAirDateYear, lastAirDateYear].flatMap { $0 }.joined(separator: " - ")
    }
}
