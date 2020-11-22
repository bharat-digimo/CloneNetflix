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
    
    var allGenres: [HomeGenre] = [.AllGenres, .Action, .Comedy, .Horror, .Thriller]
    
    func getMovies(forCat cat: String, andHomeRow homeRow: HomeTopRow, andGenre genre: HomeGenre) -> [Movie] {
        
        switch homeRow {
        case .home:
            return movies[cat] ?? []
        case .movies:
            return (movies[cat] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
        case .tvShows:
            return (movies[cat] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre) })
        case .myList:
            return movies[cat] ?? []
        }
    }
    func setupMovies() {
        movies["Trending Now"] = exampleMovies
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["New Release"] = exampleMovies.shuffled()
        movies["Continue Watching"] = exampleMovies.shuffled()
        movies["Sci-fi Movies"] = exampleMovies.shuffled()
    }
}
