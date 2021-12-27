//
//  Artwork.swift
//  DZ01-1
//
//  Created by Simo on 27.12.2021.
//

import Foundation

struct Artwork: Identifiable {
    var id = UUID()
    var name: String
    var author: String
    var year: String
    var size: String
    var technique: String
    var collection: String
}
