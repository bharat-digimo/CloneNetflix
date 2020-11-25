//
//  DownloadsView.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/25/20.
//

import SwiftUI

struct DownloadsView: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Image(systemName: "info.circle")
                    Text("Smart downloads")
                    Text("ON")
                        .foregroundColor(.blue)
                    
                    Spacer()
                }
                .padding()
                .font(.system(size: 18, weight: .bold))
                
                ZStack {
                    Circle()
                        .foregroundColor(.graySearchBackground)
                        .padding(.horizontal, 100)
                    
                    Image(systemName: "arrow.down.to.line.alt")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 75)
                        .foregroundColor(.gray)
                }
                .frame(height: 275)
                .padding()

                VStack(spacing: 20) {
                    Text("Never be without Netflix")
                        .font(.title2)
                        .bold()
                    Text("Download movies and shows so that you'll never be without something to watch -- \nEven if you are offline")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("See what you can Download")
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                    })
                    
                }
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct DownloadsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            DownloadsView()
        }
    }
}
