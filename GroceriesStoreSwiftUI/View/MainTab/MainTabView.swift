//
//  MainTabView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 25/1/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        ZStack {
            if(homeVM.selecTab == 0) {
                HomeView()
            } else if(homeVM.selecTab == 1) {
                ExploreView()
            }
            else if(homeVM.selecTab == 2) {
                MyCartView()
            }
            else if(homeVM.selecTab == 3) {
                FavoriteView()
            }
            else if(homeVM.selecTab == 4) {
                AccountView()
            }
            
            VStack {
                Spacer()
                HStack {
                    
                    TabButton(title: "Shop", icon: "store_tab", isSelect: homeVM.selecTab == 0) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selecTab = 0
                            }
                        }
                    }
                    
                    TabButton(title: "Explore", icon: "explore_tab", isSelect: homeVM.selecTab == 1) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selecTab = 1
                            }
                        }                }
                    
                    TabButton(title: "Cart", icon: "cart_tab", isSelect: homeVM.selecTab == 2) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selecTab = 2
                            }
                        }
                    }
                    
                    
                    TabButton(title: "Favorite", icon: "fav_tab", isSelect: homeVM.selecTab == 3) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selecTab = 3
                            }
                        }
                    }
                    
                    
                    TabButton(title: "Account", icon: "account_tab", isSelect: homeVM.selecTab == 4) {
                        DispatchQueue.main.async {
                            withAnimation {
                                homeVM.selecTab = 4
                            }
                        }
                    }
                    
                }
                .padding(.top, 10)
                .padding(.bottom,.bottomInsets)
                .padding(.horizontal, 10)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        MainTabView()
    }
}
