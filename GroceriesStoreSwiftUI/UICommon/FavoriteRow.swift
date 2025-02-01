//
//  FavoriteRow.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 1/2/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteRow: View {
    @State var favorite: FavoriteModel = FavoriteModel(dict: [:])
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                WebImage(url: URL(string: favorite.image))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
                VStack(spacing: 4) {
                    Text(favorite.name)
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(favorite.unitValue) \(favorite.unitName), price")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.secondary)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                Text("$\(favorite.price, specifier: "%.2f")")
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.primaryText)
                
                Image("next")
                    .resizable()
                    .frame(width: 15, height: 15)
                 
            }
            Divider()
        }
    }
}

#Preview {
    FavoriteRow()
}
