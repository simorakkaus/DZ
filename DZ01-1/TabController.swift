//
//  TabController.swift
//  DZ01-1
//
//  Created by Simo on 28.12.2021.
//

import Foundation

class TabController: ObservableObject {
    @Published var activeTab = Tab.artworks
    func open(_ tab: Tab) {
        activeTab = tab
    }
}
