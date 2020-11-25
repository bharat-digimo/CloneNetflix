//
//  ComingSoonVM.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/25/20.
//

import Foundation

class ComingSoonVM: ObservableObject {
    
    @Published var movies: [Movie]
    
    init() {
        self.movies = generateMovies(20)
    }
}
