//
//  MovieDetailsView.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/19/20.
//

import SwiftUI

struct MovieDetailsView: View {
    var movie: Movie
    let screen = UIScreen.main.bounds
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                    })
                }
                .padding(.trailing, 22)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width / 2.5)
                        
                        MovieSubHeadingInfoView(movie: movie)
                        if let text = movie.promotionalText  {
                            Text(text)
                                .bold()
                                .font(.headline)
                        }
                    }
                }
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: exampleMovie6)
    }
}

struct MovieSubHeadingInfoView: View {
    var movie: Movie
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            Text(String(movie.year))
            RatingView(rating: movie.rating)
            Text(movie.numberOfSeasonDisplay)
            HDView()
        }
        .foregroundColor(.gray)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String
    var body: some View {
        ZStack {
            Rectangle()
                .background(Color.gray)
                .frame(width: 55, height: 20)
            
            Text(rating)
                .foregroundColor(.black)
                .font(.system(size: 14))
                .bold()
        }
    }
}

struct HDView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.gray, lineWidth: 2)
                .frame(width: 40)
            
            Text("HD")
                .foregroundColor(.white)
                .font(.system(size: 14))
                .bold()
        }
    }
}
