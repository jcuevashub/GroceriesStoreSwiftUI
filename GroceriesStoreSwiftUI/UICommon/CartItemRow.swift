//
//  CartItemRow.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 8/2/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItemRow: View {
    @State var cartItem: CartItemModel = CartItemModel(dict: [:])
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                WebImage(url: URL(string: cartItem.image))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
                VStack(spacing: 4) {
                    HStack {
                        Text(cartItem.name)
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            CartViewModel.shared.serviceCallRemove(cObj: cartItem)
                        } label: {
                            Image("close")
                                .resizable()
                                .frame(width: 18, height: 18)
                        }
                    }
                    Text("\(cartItem.unitValue) \(cartItem.unitName), price")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.secondary)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom,8)
                    
                    HStack {
                        HStack {
                            Button {
                                CartViewModel.shared.serviceCallUpdateQyt(cObj: cartItem, newQyt: cartItem.qty - 1)
                            } label: {
                                Image("subtack")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(10)
                            }
                            .padding(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.placeholder.opacity(0.5), lineWidth: 1)
                            )
                            
                            Text("\(cartItem.qty)")
                                .font(.customfont(.bold, fontSize: 24))
                                .foregroundColor(.primaryText)
                                .multilineTextAlignment(.center)
                                .frame(width: 45, height: 45, alignment: .center)
                            
                            
                            Button {
                                CartViewModel.shared.serviceCallUpdateQyt(cObj: cartItem, newQyt: cartItem.qty + 1)
                            } label: {
                                Image("add_green")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(10)
                            }
                            .padding(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.placeholder.opacity(0.5), lineWidth: 1)
                            )
                            
                            
                            Spacer()
                            Text("$\((cartItem.price) * Double(cartItem.qty), specifier: "%.2f")")
                                .font(.customfont(.bold, fontSize: 20))
                                .foregroundColor(.primary)
                        }
                        
                    }
                }
                
            }
            Divider()
        }
    }
}

#Preview {
    CartItemRow(cartItem: CartItemModel(dict: [   "cart_id": 37,
                                                  "user_id": 2,
                                                  "prod_id": 9,
                                                  "qty": 1,
                                                  "cat_id": 3,
                                                  "brand_id": 1,
                                                  "type_id": 1,
                                                  "name": "Broiler Chicken",
                                                  "detail": "When consumed in moderation, beef can improve muscle growth and maintenance. It’s also rich in iron and zinc. But high consumption of beef has been linked to an increased risk for heart disease and cancer.",
                                                  "unit_name": "kg",
                                                  "unit_value": "1",
                                                  "nutrition_weight": "100g",
                                                  "price": 3.99,
                                                  "created_date": "2023-07-31T10:11:55.000Z",
                                                  "modify_date": "2023-07-31T10:11:55.000Z",
                                                  "cat_name": "Meat & Fish",
                                                  "is_fav": 0,
                                                  "brand_name": "bigs",
                                                  "type_name": "Pulses",
                                                  "offer_price": 3.99,
                                                  "start_date": "",
                                                  "end_date": "",
                                                  "is_offer_active": 0,
                                                  "image": "http://localhost:3001/img/product/202307311011551155pIjIPWIb4w.png",
                                                  "item_price": 3.99,
                                                  "total_price": 3.99]))
    .padding(.horizontal, 20)
}
