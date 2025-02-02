//
//  ExploreView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 25/1/25.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var exploreVM = ExploreViewModel.shared
    @State var txtSearch: String = ""
    
    var colums = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("Find Products")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                }
                .padding(.top, .topInsets)
                
                SearchTextField(placeholder: "Search Store", txt: $txtSearch)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                
                ScrollView {
                    LazyVGrid(columns: colums, spacing: 20) {
                        ForEach(exploreVM.listArr, id: \.id) {
                            category in
                            
                            NavigationLink(destination: ExploreItemsView(itemsVM: ExploreItemViewModel(catObj: category))) {
                                ExploreCategoryCell(category: category)
                                    .aspectRatio(0.95, contentMode: .fill)
                            }

                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .padding(.bottom, .bottomInsets + 60)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        ExploreView()
    }
}
