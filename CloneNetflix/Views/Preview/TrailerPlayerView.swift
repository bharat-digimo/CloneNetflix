//
//  TrailerPlayerView.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/25/20.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    let videoURL: URL?
    @Binding var playVideo: Bool
    
    var body: some View {
        if let url = videoURL {
            VideoPlayer(url: url, play: $playVideo)
        } else {
            Text("Can not play the video at this time")
        }
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(videoURL: nil, playVideo: .constant(true))
    }
}
