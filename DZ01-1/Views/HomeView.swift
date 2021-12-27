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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
