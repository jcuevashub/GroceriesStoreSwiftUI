//
//  MainTabView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 25/1/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        MainViewModel.shared.isUserLogin = false
                    } label: {
                        Text("Logout")
                    }
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
