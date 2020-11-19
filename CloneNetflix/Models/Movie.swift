//
//  Movie.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/6/20.
//

import Foundation
struct Movie: Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    var year: Int
    var rating: String
    var seasons: Int?
    var episodes: [Episode]?
    var promotionalText: String?
    
    var numberOfSeasonDisplay: String {
        guard let num = seasons else { return "" }
        return num == 1 ? "1 Season" : "\(num) Seasons"
    }
}
