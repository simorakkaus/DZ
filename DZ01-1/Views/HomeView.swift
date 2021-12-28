//
//  HomeView.swift
//  DZ01-1
//
//  Created by Simo on 27.12.2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var tabController: TabController
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("Home View").font(.title)
                
                Button("Open Settings View") {
                    tabController.open(.settings)
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                
                NavigationLink(destination: ArtworkDetails(artwork: artWorks[1])) {
                    Text("Open Artwork Details")
                        .padding()
                        .background(.pink)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
