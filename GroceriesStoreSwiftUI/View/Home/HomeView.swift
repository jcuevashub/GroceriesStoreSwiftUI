//
//  HomeView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 25/1/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        VStack {
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
                    
                    Text("Santo Domingo, DR")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.gray)
                }
                SearchTextField(placeholder: "Search Store", txt: $homeVM.txtSearch)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                
              
                
            }.padding(.top, 60)
               
            ScrollView {
                Image("banner_top")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 115)
                    .padding(.horizontal, 20)
                
                SectionTitleAll(title: "Exclusive offer", titleAll: "See All") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 15) {
                        ForEach(homeVM.offerArr, id: \.id) { product in
                            ProductCell(product: product, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: product.prodId, qty: 1) {isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                    
                                }
                            })
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
                        ForEach(homeVM.bestArr, id: \.id) { product in
                            
                            ProductCell(product: product, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: product.prodId, qty: 1) {isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true

                                }
                            })
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
                        ForEach(homeVM.typeArr, id: \.id) { category in
                            CategoryCell(type: category, didAddCart: {
                                
                            })
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, 15)
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 15) {
                        ForEach(homeVM.listArr, id: \.id) { product in
                            ProductCell(product: product, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: product.prodId, qty: 1) {isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                }
                            })
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, .bottomInsets + 46)
                
            }
        }
        .alert(isPresented: $homeVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(homeVM.errorMessage), dismissButton: .default(Text("OK")))
        })
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
