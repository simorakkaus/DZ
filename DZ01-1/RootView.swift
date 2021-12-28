//
//  ContentView.swift
//  DZ01-1
//
//  Created by Simo on 03.12.2021.
//

import SwiftUI

let artWorks = [
    Artwork(name: "Сосна на песке", author: "Иван Иванович Шишкин", year: "1884", size: "69,5x105 см", technique: "Холст, масло", collection: "Рыбинский музей-заповедник"),
    Artwork(name: "Березовая роща", author: "Исаак Ильич Левитан", year: "1889", size: "28,5х50 см", technique: "Бумага на холсте, масло", collection: "Государственная Третьяковская галерея")
]

struct RootView: View {
    @StateObject private var tabController = TabController()
    
    var body: some View {
        
        TabView(selection: $tabController.activeTab) {
            
            NavigationHost()
                .environmentObject(NavigationStack(NavigationItem(view: AnyView(
                    HomeView()
                        .tag(Tab.home)
                        .tabItem { Label("Home", systemImage: "house") }
                ))))
            
            NavigationHost()
                .environmentObject(NavigationStack(NavigationItem(view: AnyView(
                    ArtworksView()
                        .tag(Tab.artworks)
                        .tabItem { Label("Artworks", systemImage: "photo.circle.fill") }
                ))))
            
            NavigationHost()
                .environmentObject(NavigationStack(NavigationItem(view: AnyView(
                    SettingsView()
                        .tag(Tab.settings)
                        .tabItem { Label("Settings", systemImage: "gearshape") }
                ))))
        }
        .environmentObject(tabController)
    }
}

class TabController: ObservableObject {
    @Published var activeTab = Tab.artworks
    func open(_ tab: Tab) {
        activeTab = tab
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
