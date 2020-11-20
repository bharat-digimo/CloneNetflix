//
//  Trailor.swift
//  CloneNetflix
//
//  Created by Bharat Lal on 11/20/20.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
