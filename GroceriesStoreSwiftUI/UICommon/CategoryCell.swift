//
//  CategoryCell.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 25/1/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryCell: View {
    @State var type: TypeModel = TypeModel(dict: [:])
    @State var color: Color = Color.yellow
    var didAddCart: (() ->())?
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: type.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 70, height: 70)
            
            
            Text(type.typeName)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(15)
        .frame(width: 250, height: 100)
        .background(type.color.opacity(0.3))
        .cornerRadius(16)
    }
}

#Preview {
    CategoryCell(type: TypeModel(dict: [   "type_id": 1,
                                           "type_name": "Pulses",
                                           "image": "http://localhost:3001/img/type/202307261610181018aVOpgmY1W1.png",
                                           "color": "F8A44C",  "type_id": 3,
                                           "type_name": "Rice",
                                           "image": "http://localhost:3001/img/type/202307311000160168a0737aEiC.png",
                                           "color": "53B175"]))
}
