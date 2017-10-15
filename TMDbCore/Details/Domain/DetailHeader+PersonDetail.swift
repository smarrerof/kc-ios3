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
        backdropPath = nil

        metadata = [person.birthDay, person.deathDay].flatMap { $0 }.joined(separator: " - ")
    }
}
