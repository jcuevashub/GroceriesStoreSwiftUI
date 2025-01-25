//
//  ProductCel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 25/1/25.
//

import SwiftUI

struct ProductCell: View {
    var didAddCart: (() ->())?
    var body: some View {
        VStack {
            Image("banana")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 80)
            
            Spacer()
            
            Text("Banana")
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Text("7pcs, price")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundColor(.secondary)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            HStack{
                Text("$2.99")
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                Button {
                    didAddCart?()
                } label: {
                    Image("add")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
                .frame(width: 40, height: 40)
                .background(Color.primaryApp)
                .cornerRadius(15)
            }

        }
        .padding(15)
        .frame(width: 180, height: 230)
        .overlay (
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.placeholder.opacity(0.5), lineWidth: 1)
        )
    }
}

#Preview {
    ProductCell()
}
