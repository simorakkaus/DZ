//
//  NavigationStack.swift
//  DZ01-1
//
//  Created by Simo on 27.12.2021.
//

import SwiftUI

final class NavigationStack: ObservableObject {
    @Published var viewStack: [NavigationItem] = []
    @Published var currentView: NavigationItem
    
    init(_ currentView: NavigationItem) {
        self.currentView = currentView
    }
    
    func unwind() {
        if viewStack.count == 0 {
            return
        }
        
        let last = viewStack.count - 1
        currentView = viewStack[last]
        viewStack.remove(at: last)
    }
    
    func advance(_ view: NavigationItem) {
        viewStack.append(currentView)
        currentView = view
    }
    
    func home() {
        currentView = NavigationItem(view: AnyView(HomeView()))
        viewStack.removeAll()
    }
}
