//
//  ArtworkView.swift
//  DZ01-1
//
//  Created by Simo on 27.12.2021.
//

import SwiftUI

struct ArtworksView: View {
    @EnvironmentObject var navigation: NavigationStack
    
    var body: some View {
        List(artWorks) { artwork in
            ArtworkRow(artwork: artwork).onTapGesture {
                self.navigation.advance(NavigationItem(view: AnyView(ArtworkDetails(artwork: artwork))))
            }
        }
    }
}

struct ArtworksView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworksView()
    }
}
