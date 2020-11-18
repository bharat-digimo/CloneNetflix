//
//  TopMoviePreview.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/18/20.
//

import SwiftUI
import KingfisherSwiftUI

struct TopMoviePreview: View {
    let movie: Movie
    func shouldShowCircleAfterCategory(_ cat: String) -> Bool {
        guard let index = movie.categories.firstIndex(of: cat) else {
            return false
        }
        return index + 1 != movie.categories.count
    }
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
            VStack {
                Spacer()
                HStack {
                    ForEach(movie.categories, id: \.self) { category in
                        Text(category)
                        if shouldShowCircleAfterCategory(category) {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.blue)
                                .font(.system(size: 4))
                        }
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie1)
    }
}
