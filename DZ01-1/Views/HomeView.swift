//
//  HomeView.swift
//  DZ01-1
//
//  Created by Simo on 27.12.2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var tabController: TabController
    @EnvironmentObject var navigation: NavigationStack
    
    var body: some View {
        VStack {
            Text("Home View").font(.title)
            Button("Open Settings View") {
                tabController.open(.settings)
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            
            Button("Open List Item View") {
                
            }
            .padding()
            .background(.green)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
