//
//  ExploreCategoryCell.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 2/2/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExploreCategoryCell: View {
    @State var category: ExploreCategoryModel = ExploreCategoryModel(dict: [:])
    @State var color: Color = Color.yellow
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: category.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 120, height: 90)
            
            Spacer()
            Text(category.catName)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            Spacer()
            
        }
        .padding(15)
        .background(category.color.opacity(0.3))
        .cornerRadius(16)
        .overlay (
            RoundedRectangle(cornerRadius: 16)
                .stroke(category.color, lineWidth: 1)
        )
    }
}

#Preview {
    ExploreCategoryCell(category: ExploreCategoryModel( dict: [   "cat_id": 1,
                                                                  "cat_name": "Pulses",
                                                                  "image": "http://localhost:3001/img/type/202307261610181018aVOpgmY1W1.png",
                                                                  "color": "F8A44C",  "cat_id": 3,
                                                                  "cat_name": "Rice",
                                                                  "image": "http://localhost:3001/img/type/202307311000160168a0737aEiC.png",
                                                                  "color": "53B175"])).padding(20)
}
