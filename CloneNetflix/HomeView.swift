//
//  HomeView.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/5/20.
//

import SwiftUI

struct HomeView: View {
    let vm = HomeVM()
    let screen = UIScreen.main.bounds
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    
                    TopMoviePreview(movie: exampleMovie3)
                        .frame(width: screen.width)
                        .padding(.top, -110)
                    
                    ForEach(vm.allCategories, id: \.self) { category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(vm.getMovies(forCat: category)) { movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 20)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
