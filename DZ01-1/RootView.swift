//
//  ContentView.swift
//  DZ01-1
//
//  Created by Simo on 03.12.2021.
//

import SwiftUI

struct RootView: View {
    @StateObject private var tabController = TabController()
    
    var body: some View {
        
        TabView(selection: $tabController.activeTab) {
            
            HomeView()
                .tag(Tab.home)
                .tabItem { Label("Home", systemImage: "house") }
            
            ArtworksView()
                .tag(Tab.artworks)
                .tabItem { Label("Artworks", systemImage: "photo.circle.fill") }
            
            SettingsView()
                .tag(Tab.settings)
                .tabItem { Label("Settings", systemImage: "gearshape") }
            
        }
        .environmentObject(tabController)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
