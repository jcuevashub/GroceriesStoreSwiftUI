//
//  MyOrdersView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 1/3/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyOrdersView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var myVM = MyOrdersViewModel.shared
    
    var body: some View {
        ZStack {
            ScrollView{
                LazyVStack(spacing: 15){
                    ForEach(myVM.listArr, id: \.id, content: {
                        order in
                        
                        VStack {
                            HStack {
                                Text("Order No: #")
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.primary)
                                
                                Text("\(order.id)")
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.primary)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text(getOrderStatus(mObj: order))
                                    .font(.customfont(.bold, fontSize: 16))
                                    .foregroundColor(getOrderStatusColor(mObj: order))
                                
                            }
                            
                            Text(order.createdDate.displayDate(format: "yyyy-MM-dd hh:mm a"))
                                .font(.customfont(.bold, fontSize: 12))
                                .foregroundColor(.secondary)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                            HStack {
                                if let imageUrl = order.images.first {
                                    WebImage(url: URL(string: imageUrl))
                                        .resizable()
                                        .indicator(.activity)
                                        .transition(.fade(duration: 0.5))
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                }
                                VStack {
                                    HStack {
                                        Text("Items: #")
                                            .font(.customfont(.bold, fontSize: 14))
                                            .foregroundColor(.primary)
                                        
                                        Text(order.names)
                                            .font(.customfont(.bold, fontSize: 14))
                                            .foregroundColor(.primary)
                                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        
                                    }
                                    
                                    HStack {
                                        Text("Delivery Type: #")
                                            .font(.customfont(.bold, fontSize: 14))
                                            .foregroundColor(.primary)
                                        
                                        Text(self.getDeliveryType(mObj: order))
                                            .font(.customfont(.bold, fontSize: 14))
                                            .foregroundColor(.primary)
                                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        
                                    }
                                    
                                    HStack {
                                        Text("Payment Type: #")
                                            .font(.customfont(.bold, fontSize: 14))
                                            .foregroundColor(.primary)
                                        
                                        Text(self.getPaymentType(mObj: order))
                                            .font(.customfont(.bold, fontSize: 14))
                                            .foregroundColor(.primary)
                                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                    HStack {
                                        Text("Payment Status: #")
                                            .font(.customfont(.bold, fontSize: 14))
                                            .foregroundColor(.primary)
                                        
                                        Text(self.getPaymentStatus(mObj: order))
                                            .font(.customfont(.bold, fontSize: 14))
                                            .foregroundColor(getPaymentStatusColor(mObj: order))
                                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    }
                                }
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
                    
                    Text("My Orders")
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
    
    func getOrderStatus(mObj: MyOrderModel) -> String {
        switch mObj.orderStatus {
        case 1:
            return "Place";
        case 2:
            return "Accepted";
        case 3:
            return "Delivered";
        case 4:
            return "Cancel";
        case 5:
            return "Declined";
        default:
            return "";
        }
    }
    
    func getDeliveryType(mObj: MyOrderModel) -> String {
        switch mObj.deliverType {
        case 1:
            return "Delivery";
        case 2:
            return "Collection";
        default:
            return "";
        }
    }
    
    func getPaymentType(mObj: MyOrderModel) -> String {
        switch mObj.paymentType {
        case 1:
            return "Cash On Delivery";
        case 2:
            return "Online Card Payment";
        default:
            return "";
        }
    }
    
    func getPaymentStatus(mObj: MyOrderModel) -> String {
        switch mObj.paymentStatus {
        case 1:
            return "Processing";
        case 2:
            return "Success";
        case 3:
            return "Fail";
        case 4:
            return "Refunded";
        default:
            return "";
        }
    }
    
    
    func getPaymentStatusColor(mObj: MyOrderModel) -> Color {
        if(mObj.paymentType == 1) {
            return Color.orange
        }
        
        switch mObj.paymentStatus {
        case 1:
            return Color.blue;
        case 2:
            return Color.green;
        case 3:
            return Color.red;
        case 4:
            return Color.green;
        default:
            return Color.white;
        }
    }
    
    func getOrderStatusColor(mObj: MyOrderModel) -> Color {
        switch mObj.orderStatus {
        case 1:
            return Color.blue;
        case 2:
            return Color.green;
        case 3:
            return Color.green;
        case 4:
            return Color.red;
        case 5:
            return Color.red;
        default:
            return Color.primaryApp;
        }
    }
}


#Preview {
    NavigationView {
        MyOrdersView()
    }
}
