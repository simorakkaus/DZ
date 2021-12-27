//
//  ArtworkDetails.swift
//  DZ01-1
//
//  Created by Simo on 27.12.2021.
//

import SwiftUI

struct ArtworkDetails: View {
    
    var artwork: Artwork
    
    var artworkImage: Image {
        Image(artwork.name)
    }
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ScrollView(.vertical, showsIndicators: false) {
                    artworkImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: 400)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(artwork.name).font(.title).bold()
                        Text(artwork.author).font(.body)
                        Text("Время создания").font(.headline)
                        Text(artwork.year).font(.body)
                        Text("Размер").font(.headline)
                        Text(artwork.size).font(.body)
                        Text("Техника").font(.headline)
                        Text(artwork.technique).font(.body)
                        Text("Колллекция").font(.headline)
                        Text(artwork.collection).font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                }
            }
        }
    }
}
