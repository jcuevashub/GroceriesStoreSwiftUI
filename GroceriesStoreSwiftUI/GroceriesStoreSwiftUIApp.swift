//
//  GroceriesStoreSwiftUIApp.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 5/3/24.
//

import SwiftUI

@main
struct GroceriesStoreSwiftUIApp: App {
    @StateObject var mainVm = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if mainVm.isUserLogin {
                    MainTabView()
                } else {
                    WelcomeView()
                }
            }
        }
    }
}
