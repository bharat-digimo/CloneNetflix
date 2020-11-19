//
//  SmallVerticalButton.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/18/20.
//

import SwiftUI

struct SmallVerticalButton: View {
    var isOn: Bool
    var text: String
    var imageForSelected: String
    var imageForNonSelected: String
    
    private var imageName: String {
         isOn ? imageForSelected : imageForNonSelected
    }
    
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(.white)
                Text(text)
                    .font(.system(size: 14))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 2)
            }
        })
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            SmallVerticalButton(isOn: true, text: "My List", imageForSelected: "checkmark", imageForNonSelected: "plus") {
                print("action")
            }
        }
    }
}
