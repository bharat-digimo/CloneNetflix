//
//  WhiteButton.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/18/20.
//

import SwiftUI

struct WhiteButton: View {
    var text: String
    var imageName: String
    
    var action: () -> Void
    var body: some View {
        Button(action: action, label: {
            HStack {
                Spacer()
                Image(systemName: imageName)
                    .font(.headline)
                
                Text(text)
                    .font(.system(size: 16))
                    .bold()
                Spacer()
            }
            .padding(.vertical, 6)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(3.0)
        })
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            WhiteButton(text: "Play", imageName: "play.fill") {
                print("Tapped")
            }
        }
    }
}
