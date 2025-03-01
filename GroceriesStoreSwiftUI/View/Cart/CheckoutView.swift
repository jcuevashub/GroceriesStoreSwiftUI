//
//  CheckoutView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 1/3/25.
//

import SwiftUI

struct CheckoutView: View {
    
    @Binding var isShow: Bool
    @StateObject var cartVM = CartViewModel.shared
    
    var body: some View {
        VStack{
            Spacer()
            VStack {
                HStack {
                    Text("Checkout")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    Button {
                        $isShow.wrappedValue = false
                    } label: {
                        Image("close")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                }.padding(.top, 20)
                
                Divider()
                
                VStack {
                    HStack {
                        Text("Delivery Type")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.secondary)
                            .frame(height: 46)
                        Spacer()
                        
                        Picker("", selection: $cartVM.deliveryType) {
                            Text("Delivery").tag(1);
                            Text("Collection").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 180)
                    }
                    
                    Divider()
                    
                    if(cartVM.deliveryType == 1) {
                        NavigationLink {
                            DeliveryAddressView(isPicker: true, didSelect: {
                                aObj in cartVM.deliverOBj = aObj
                            })
                        } label: {
                            HStack {
                                Text("Delivery")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.secondary)
                                    .frame(height: 46)
                                
                                Spacer()
                                
                                Text(cartVM.deliverOBj?.name ?? "Select an Address")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                    .frame(height: 46)
                                
                                Image("next")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.primaryText)
                                
                            }
                        }
                        Divider()
                    }
                    
                    HStack {
                        Text("Payment Type")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.secondary)
                            .frame(height: 46)
                        Spacer()
                        
                        Picker("", selection: $cartVM.paymentType) {
                            Text("COD").tag(1);
                            Text("Online").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 180)
                    }
                    
                    Divider()
                    
                    if(cartVM.paymentType == 2) {
                        NavigationLink {
                            PaymentMethodsView(isPicker: true, didSelect: {
                                aObj in cartVM.paymentObj = aObj
                            })
                        } label: {
                            HStack {
                                Text("Payment")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.secondary)
                                    .frame(height: 46)
                                
                                Spacer()
                                
                                Image("master")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 20)
                                    .foregroundColor(.primaryText)
                                
                                Text(cartVM.paymentObj?.cardNumber ?? "Select")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                    .frame(height: 46)
                                
                                Image("next")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.primaryText)
                                
                            }
                        }
                        Divider()
                    }
                    NavigationLink {
                        PromoCodeView(isPicker: true, didSelect: {
                            aObj in cartVM.promoObj = aObj
                        })
                    } label: {
                        
                        HStack {
                            Text("Promo Code")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.secondary)
                                .frame(height: 46)
                            
                            Spacer()
                            
                            Text(cartVM.promoObj?.code ?? "Pick Discount")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.primaryText)
                                .frame(height: 46)
                            
                            Image("next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.primaryText)
                            
                        }
                    }
                    Divider()
                    
                }
                
                VStack {
                    HStack {
                        Text("Total")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text("$ \(cartVM.total)")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondary)
                        
                    }
                    
                    HStack {
                        Text("Delivery Cost")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text("+ $ \(cartVM.deliveryPriceAmount)")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondary)
                        
                    }
                    HStack {
                        Text("Discount")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text("- $ \(cartVM.discountAmount)")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.red)
                        
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 15)
                
                HStack {
                    Text("Final Total")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.secondary)
                        .frame(height: 46)
                    
                    Spacer()
                    
                    Text("$\(cartVM.userPayAmount)")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.primaryText)
                        .frame(height: 46)
                    
                    Image("next")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primaryText)
                    
                }
                Divider()
                
                VStack {
                    Text("By continuing you agree to our")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.secondary)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Text("Terms of Service")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryApp)
                        
                        Text(" and ")
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.secondary)
                        
                        Text("Privacy Policy")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryApp)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                    }
                }.padding(.vertical, .screenWidth * 0.03)
                
                RoundButton(title: "Proceed Order") {
                    cartVM.serviceCallOrderPlace()
                }
                .padding(.bottom, .bottomInsets + 60)
                
            }
            .padding(.horizontal, 20)
            .background(Color.white)
            .cornerRadius(20, corner: [.topLeft, .topRight])
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    @State static var isShow: Bool = false;
    
    static var previews: some View {
        NavigationView {
            CheckoutView(isShow: $isShow)
        }
    }
}
