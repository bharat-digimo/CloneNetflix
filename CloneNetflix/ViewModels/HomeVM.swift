//
//  HomeVM.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/6/20.
//

import Foundation
class HomeVM: ObservableObject {
    @Published var movies: [String : [Movie]] = [:]
    
    init() {
        setupMovies()
    }
    var allCategories: [String] {
        movies.keys.map({ String($0) })
    }
    func getMovies(forCat cat: String) -> [Movie] {
        return movies[cat] ?? []
    }
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Release"] = exampleMovies.shuffled()
        movies["Continue Watching"] = exampleMovies.shuffled()
        movies["Sci-fi Movies"] = exampleMovies.shuffled()
    }
}
