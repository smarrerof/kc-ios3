//
//  Array+Extensions.swift
//  TMDbCore
//
//  Created by Sergio Marrero Fernandez on 11/3/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        
        return result
    }
}
