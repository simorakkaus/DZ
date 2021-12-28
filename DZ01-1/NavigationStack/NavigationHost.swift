//
//  NavigationHost.swift
//  DZ01-1
//
//  Created by Simo on 27.12.2021.
//

import SwiftUI

struct NavigationHost: View {
    @EnvironmentObject var navigation: NavigationStack
    
    var body: some View {
        self.navigation.currentView.view
    }
}
