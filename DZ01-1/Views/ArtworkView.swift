//
//  ArtworkView.swift
//  DZ01-1
//
//  Created by Simo on 27.12.2021.
//

import SwiftUI

struct ArtworksView: View {
    var body: some View {
        NavigationView {
            List(artWorks) { artwork in
                NavigationLink(destination: ArtworkDetails(artwork: artwork)) {
                    ArtworkRow(artwork: artwork)
                }
            }
            .navigationBarTitle("Artworks")
        }
    }
}

struct ArtworksView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworksView()
    }
}
