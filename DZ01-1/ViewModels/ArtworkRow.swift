//
//  ArtworkRow.swift
//  DZ01-1
//
//  Created by Simo on 27.12.2021.
//

import SwiftUI

struct ArtworkRow: View {
    
    var artwork: Artwork
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(artwork.author).font(.subheadline).foregroundColor(.gray)
                Text(artwork.name).font(.title3)
            }
            HStack {
                Text("Время создания").font(.subheadline).foregroundColor(.gray)
                Spacer()
                Text(artwork.year + " год").font(.title3)
            }
        }
    }
}
