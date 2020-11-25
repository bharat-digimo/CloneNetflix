//
//  PreviewVM.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/25/20.
//

import Foundation
import SwiftUI

class PreviewVM: ObservableObject {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
