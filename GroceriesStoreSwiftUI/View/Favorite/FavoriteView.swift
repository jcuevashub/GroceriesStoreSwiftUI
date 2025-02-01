//
//  FavoriteView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 1/2/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteView: View {
    @StateObject var favVM = FavoriteViewModel.shared
    
    var body: some View {
        ZStack {
            ScrollView{
                LazyVStack{
                    ForEach(favVM.listArr, id: \.id, content: {
                        favorite in
                        
                        FavoriteRow(favorite: favorite)
                    })
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)
            }
           
            
            VStack{
                HStack {
                    Spacer()
                    
                    Text("Favorites")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                }
                .padding(.top, .topInsets)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 2)
                
                Spacer()
                
                RoundButton(title: "Add All To Cart")
                    .padding(.horizontal, 20)
                    .padding(.bottom, .bottomInsets + 60)
            }
        }
        .onAppear {
            favVM.serviceCallList()
        }
    }
}

#Preview {
    FavoriteView()
}
