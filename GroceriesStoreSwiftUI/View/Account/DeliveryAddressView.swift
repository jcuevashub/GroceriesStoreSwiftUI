//
//  DeliveryAddressView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 15/2/25.
//

import SwiftUI

struct DeliveryAddressView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    
    @State var isPicker: Bool = false
    var didSelect:((_ obj: AddressModel) -> ())?

    var body: some View {
        ZStack {
            ScrollView{
                LazyVStack(spacing: 15){
                    ForEach(addressVM.listArr, id: \.id, content: {
                        addressItem in
                        
                        HStack(spacing: 15) {
                            VStack {
                                HStack {
                                    Text(addressItem.name)
                                        .font(.customfont(.bold, fontSize: 14))
                                        .foregroundColor(.primary)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    
                                    Text(addressItem.typeName)
                                        .font(.customfont(.bold, fontSize: 12))
                                        .foregroundColor(.primary)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 2)
                                        .background(Color.secondary.opacity(0.3))
                                        .cornerRadius(5)
                                    
                                }
                                
                                
                                Text("\(addressItem.address),\(addressItem.city),\(addressItem.state),\(addressItem.postalCode)")
                                    .font(.customfont(.medium, fontSize: 14))
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.leading)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text(addressItem.phone)
                                    .font(.customfont(.bold, fontSize: 12))
                                    .foregroundColor(.secondary)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                            }
                            
                            VStack {
                                Spacer()
                                
                                NavigationLink {
                                    AddDeliveryAddressView(isEdit: true, editObj: addressItem)
                                } label : {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.primaryApp)
                                }.padding(.bottom, 8)
                                
                                Button {
                                    addressVM.serviceCallRemove(cObj: addressItem)
                                } label: {
                                    Image("close")
                                        .resizable()
                                        .foregroundColor(.primaryApp)
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                }
                                Spacer()
                            }
                        }
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.15), radius: 2)
                        .onTapGesture {
                            if(isPicker) {
                                mode.wrappedValue.dismiss()
                                didSelect?(addressItem)
                            }
                        }
                        
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
                    
                    Text("Delivery Address")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    NavigationLink {
                        AddDeliveryAddressView()
                    } label : {
                        Image("add_temp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    .foregroundColor(.primaryText)
                    .padding(.bottom, 8)
         
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
    NavigationView {
        DeliveryAddressView()
    }
}
