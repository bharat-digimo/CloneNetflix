//
//  ComingSoonView.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/23/20.
//

import SwiftUI

struct ComingSoonView: View {
    @State private var showNotificationList = false
    @State private var movieDetailToShow: Movie? = nil
    @State private var navBarHidden = true
    
    @State private var scrollOffset: CGFloat = 0.0
    @State private var activeIndex = 0
    
    @ObservedObject var vm = ComingSoonVM()
    
    func updateActiveIndex(fromScroll scroll: CGFloat) {
        if scroll < 105 { // Navigation bar
            activeIndex = 0
        } else {
            let remove105 = scroll - 105 // remove top bar height
            
            let active = Int(remove105 / 410) + 1 // 400 is frame of cell and 10 is padding
            activeIndex = Int(active)
        }
    }
    
    
    var body: some View {
        let movies = vm.movies.enumerated().map({ $0 })
        
        let scrollTrackingBinding = Binding {
            return scrollOffset
        } set: { newVal in
            scrollOffset = newVal
            updateActiveIndex(fromScroll: newVal)
        }
        
        
        
        //        NavigationView {
        return Group {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                TrackableScrollView(.vertical, showIndicators: false, contentOffset: scrollTrackingBinding) {
                    LazyVStack {
                        NotificationBar(showNotificationList: $showNotificationList)
                        
                        ForEach(Array(movies), id: \.offset) { index, movie in
                            ComingSoonRow(movie: movie, movieDetailToShow: $movieDetailToShow)
                                .frame(height: 400)
                                .overlay(
                                    Group {
                                        index == activeIndex ? Color.clear : Color.black.opacity(0.8)
                                    }
                                    .animation(.easeInOut)
                                )
                        }
                    }
                }
                .foregroundColor(.white)
                
                NavigationLink(
                    destination: Text("Notifications List"),
                    isActive: $showNotificationList,
                    label: {
                        EmptyView()
                    })
                    .navigationTitle("")
                    .navigationBarHidden(navBarHidden)
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                        self.navBarHidden = true
                    })
                    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                        self.navBarHidden = false
                    })
            }
        }
        //        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}
