//
//  PromoCodeView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 22/2/25.
//

import SwiftUI

struct PromoCodeView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var promoVM = PromoCodeViewModel.shared
    
    var body: some View {
        ZStack {
            ScrollView{
                LazyVStack(spacing: 15){
                    ForEach(promoVM.listArr, id: \.id, content: {
                        promoCodeItem in
                        VStack {
                            HStack {
                                Text(promoCodeItem.title)
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.primary)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text(promoCodeItem.code)
                                    .font(.customfont(.bold, fontSize: 15))
                                    .foregroundColor(.primary)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 2)
                                    .background(Color.secondary.opacity(0.3))
                                    .cornerRadius(5)
                                
                            }
                            
                            
                            Text(promoCodeItem.description)
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                            HStack {
                                Text("Expiry Date:")
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.primary)
                                    .padding(.vertical, 8)
                                
                                Text(promoCodeItem.endDate.displayDate(format: "yyyy-MM-dd hh:mm a"))
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.primary)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                            
                        }
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.15), radius: 2)
                    })
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)
            }
            
            VStack{
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    Spacer()
                    
                    Text("Promo Code")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 2)
                
                Spacer()
            }
        }
        .onAppear {
            //favVM.serviceCallList()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    PromoCodeView()
}
