//
//  MoviePreviewCell.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/25/20.
//

import SwiftUI
import KingfisherSwiftUI

struct MoviePreviewCell: View {
    
    var movie: Movie
    let colors: [Color] = [.yellow, .red, .gray, .green, .pink, .blue, .orange]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(lineWidth: 3)
                        .foregroundColor(colors.randomElement())
            )
            
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                .offset(y: -20)
                .frame(height: 65)
        }
        
    }
}

struct MoviePreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MoviePreviewCell(movie: exampleMovie1)
                .frame(width: 200, height: 50)
        }
    }
}
