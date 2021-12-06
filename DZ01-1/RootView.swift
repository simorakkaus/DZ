//
//  ContentView.swift
//  DZ01-1
//
//  Created by Simo on 03.12.2021.
//

import SwiftUI

enum Tab {
    case home
    case artworks
    case settings
}

struct Artwork: Identifiable {
    var id = UUID()
    var name: String
    var author: String
    var year: String
    var size: String
    var technique: String
    var collection: String
}

let artWorks = [
    Artwork(name: "Сосна на песке", author: "Иван Иванович Шишкин", year: "1884", size: "69,5x105 см", technique: "Холст, масло", collection: "Рыбинский музей-заповедник"),
    Artwork(name: "Берёзовая роща", author: "Исаак Ильич Левитан", year: "1889", size: "28,5х50 см", technique: "Бумага на холсте, масло", collection: "Государственная Третьяковская галерея")
]

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

class TabController: ObservableObject {
    @Published var activeTab = Tab.artworks
    
    func open(_ tab: Tab) {
        activeTab = tab
    }
}

struct HomeView: View {
    @EnvironmentObject private var tabController: TabController
    
    var body: some View {
        VStack {
            Text("Home View")
            Button("Open Settings View") {
                tabController.open(.settings)
            }
            .padding(.vertical)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            
        }
    }
    
}

struct ArtworksView: View {
    var body: some View {
        NavigationView {
            List(artWorks) { artwork in
                NavigationLink(destination: ArtworkDetailView(artwork: artwork)) {
                    ArtworkRow(artwork: artwork)
                }
            }
            .navigationBarTitle("Artworks")
        }
    }
}

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

struct ArtworkDetailView: View {
    var artwork: Artwork
    
    var body: some View {
        VStack(spacing: 6) {
            Text(artwork.name).font(.title)
            Text(artwork.author).font(.body)
            Image(artwork.name)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .shadow(radius: 10)
                .padding(.top, 30)
                .padding(.bottom, 30)
            VStack(alignment: .leading, spacing: 10) {
                Text("Размер полотна").font(.subheadline).foregroundColor(.gray)
                Text(artwork.size).font(.body)
                Text("Техника").font(.subheadline).foregroundColor(.gray)
                Text(artwork.technique).font(.body)
                Text("Коллекция").font(.subheadline).foregroundColor(.gray)
                Text(artwork.collection).font(.body)
                
            }
            Spacer()
        }
    }
}

struct SettingsView: View {
    @State var showSheetView = false
    
    var body: some View {
        Button(action: {
            self.showSheetView.toggle()
        }) {
            Text("Show Modal View")
        }.sheet(isPresented: $showSheetView) {
            ModalView()
        }
    }
}

struct ModalView: View {
    
    @State var text = "Modal View\nWith UIKit Component"
    
    var body: some View {
        TextView(text: $text)
            .frame(width: 400, height: 100, alignment: .center)
        
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.textAlignment = .center
        uiView.font = UIFont(name: "Helvetica", size: 24)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
