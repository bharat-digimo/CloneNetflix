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
                            .font(.footnote)
                        if shouldShowCircleAfterCategory(category) {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.blue)
                                .font(.system(size: 4))
                        }
                    }
                }
                HStack {
                    Spacer()
                    SmallVerticalButton(isOn: true, text: "My List", imageForSelected: "checkmark", imageForNonSelected: "plus") {
                        //
                    }
                    Spacer()
                    PlayButton(text: "Play", imageName: "play.fill") {
                        //
                    }
                    .frame(width: 120)
                    Spacer()
                    SmallVerticalButton(isOn: true, text: "Info", imageForSelected: "info.circle", imageForNonSelected: "info.circle") {
                        //
                    }
                    Spacer()
                }
                .padding(.vertical, 14)
            }
            .background(LinearGradient.blackTopToBottom)
            .padding(.top, 300)
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie1)
    }
}
