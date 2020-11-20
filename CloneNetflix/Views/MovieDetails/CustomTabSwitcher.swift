//
//  CustomTabSwitcher.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/20/20.
//

import SwiftUI

struct CustomTabSwitcher: View {
    @State private var currentTab: CustomTab = .episodes

    var tabs: [CustomTab]
    var movie: Movie
    
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        return tab.rawValue.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            Rectangle()
                                .frame(width: widthForTab(tab), height: 6)
                                .foregroundColor(tab == currentTab ? .red : .clear)
                            
                            Button(action: {
                                currentTab = tab
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? .white : .gray)
                            })
                            .frame(width: widthForTab(tab), height: 30)
                            .buttonStyle(PlainButtonStyle())
                        }
                        .animation(.easeInOut(duration: 0.3))
                    }
                }
            }
            
            //Selected view
            switch currentTab {
            case .episodes:
                EpisodeView(episodes: movie.episodes ?? [], showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
            case .trailer:
                TrailerListView(trailers: movie.trailers)
            case .more:
                MoreLikeThisView(movies: movie.moreLikeThisMovies)
            }
        }
        .foregroundColor(.white)
    }
}
enum CustomTab: String {
    case episodes = "EPISODES"
    case trailer = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}
struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            CustomTabSwitcher(tabs: [.episodes, .trailer, .more], movie: exampleMovie1, showSeasonPicker: .constant(false), selectedSeason: .constant(1))
        }
    }
}
