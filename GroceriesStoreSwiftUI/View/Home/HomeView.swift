//
//  HomeView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 25/1/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVm = HomeViewModel.shared
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    
                    HStack {
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        
                        Text("Dhaka, Banassre")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.gray)
                    }
                    SearchTextField(placeholder: "Search Store", txt: $homeVm.txtSearch)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                    
                }.padding(.top, .topInsets)
                
                Image("banner_top")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 115)
                    .padding(.horizontal, 20)
                
                SectionTitleAll(title: "Exclisive offer", titleAll: "See All") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 15) {
                        ForEach(0...5, id: \.self) { index in
                            ProductCell {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                
                SectionTitleAll(title: "Best Selling", titleAll: "See All") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 15) {
                        ForEach(0...5, id: \.self) { index in
                            ProductCell {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                
                SectionTitleAll(title: "Groceries", titleAll: "See All") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 15) {
                        ForEach(0...5, id: \.self) { index in
                            CategoryCell(color: Color(hex: "F8A44C")) {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, 15)
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 15) {
                        ForEach(0...5, id: \.self) { index in
                            ProductCell {
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                
            }
        }
    }
}

#Preview {
    HomeView()
}
