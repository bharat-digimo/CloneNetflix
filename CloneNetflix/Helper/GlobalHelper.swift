//
//  GlobalHelper.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/6/20.
//

import Foundation
import SwiftUI

let exampleMovie1 = Movie(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https://picsum.photos/200/300")!, categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", seasons: 1)
let exampleMovie2 = Movie(id: UUID().uuidString, name: "Mirzapur", thumbnailURL: URL(string: "https://picsum.photos/200/300/")!, categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", seasons: 2, promotionalText: "New season coming soon")
let exampleMovie3 = Movie(id: UUID().uuidString, name: "Scam 1992", thumbnailURL: URL(string: "https://picsum.photos/200/301")!, categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", seasons: 3)
let exampleMovie4 = Movie(id: UUID().uuidString, name: "Aashram", thumbnailURL: URL(string: "https://picsum.photos/200/302")!, categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", seasons: 4, promotionalText: "Best rated show")
let exampleMovie5 = Movie(id: UUID().uuidString, name: "Avrodh", thumbnailURL: URL(string: "https://picsum.photos/200/303")!, categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", seasons: 5)
let exampleMovie6 = Movie(id: UUID().uuidString, name: "Family Man", thumbnailURL: URL(string: "https://picsum.photos/200/304")!, categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"], year: 2020, rating: "TV-MA", seasons: 6, promotionalText: "Watch season 6 now")

let exampleMovies = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]

extension LinearGradient {
    static let blackTopToBottom = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]), startPoint: .top, endPoint: .bottom)
}
