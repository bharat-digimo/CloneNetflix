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
    @State private var showSeasonPicker = false
    @State private var selectedSeason = 1
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
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
                            if let text = movie.promotionHeadline  {
                                Text(text)
                                    .bold()
                                    .font(.headline)
                            }
                            PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                                print("Tapped")
                            }
                            CurrentEpisodeInformationView(movie: movie)
                            CastInfoView(movie: movie)
                            
                            HStack(spacing: 30) {
                                SmallVerticalButton(isOn: true, text: "My List", imageForSelected: "checkmark", imageForNonSelected: "plus") {
                                    //
                                }
                                SmallVerticalButton(isOn: false, text: "Rate", imageForSelected: "hand.thumbsup.fill", imageForNonSelected: "hand.thumbsup") {
                                    //
                                }
                                SmallVerticalButton(isOn: true, text: "Share", imageForSelected: "square.and.arrow.up", imageForNonSelected: "square.and.arrow.up") {
                                    //
                                }
                                
                                Spacer()
                            }
                            .padding(.leading, 20)
                            
                            CustomTabSwitcher(tabs: [.episodes, .trailer, .more], movie: movie, showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
                        }
                        .padding(.horizontal, 10)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
            }
            if showSeasonPicker {
                Group {
                    Color.black.opacity(0.90)
                    VStack(spacing: 30) {
                        Spacer()
                        ForEach(0..<(movie.numberOfSeasons ?? 0)) { season in
                            Button(action: {
                                self.selectedSeason = season + 1
                                self.showSeasonPicker = false
                            }, label: {
                                Text("Season \(season + 1)")
                                    .font(selectedSeason == season + 1 ? .title : .title2)
                                    .bold()
                                    .foregroundColor(selectedSeason == season + 1 ? .white : .gray)
                                
                            })
                            
                        }
                        Spacer()
                        
                        Button(action: {
                            self.showSeasonPicker = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 40))
                                .scaleEffect(x: 1.1)
                                .foregroundColor(.white)
                        })
                        .padding(.bottom, 30)
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: exampleMovie1)
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

struct CastInfoView: View {
    var movie: Movie
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)")
                Spacer()
            }
            HStack {
                Text("Creators: \(movie.creators)")
                Spacer()
            }
        }
        .font(.callout)
        .foregroundColor(.gray)
        .padding(.vertical, 10)
    }
}

struct CurrentEpisodeInformationView: View {
    var movie: Movie
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                Spacer()
            }
            .padding(.vertical, 4)
            
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}
