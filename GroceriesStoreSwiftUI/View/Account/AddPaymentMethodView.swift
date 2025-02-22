//
//  AddPaymentMethodView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 22/2/25.
//

import SwiftUI

struct AddPaymentMethodView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var payVM = PaymentViewModel.shared
    
    var body: some View {
        ZStack {
            ScrollView{
                VStack(spacing: 15){
                    
                    LineTextField(title: "Name", placeholder: "Enter you name", txt: $payVM.txtName)
                    
                    LineTextField(title: "Card Number", placeholder: "Enter your card number",
                                  txt: $payVM.txtCardNumber, keyboardType: .numberPad)
                    
                    HStack {
                        LineTextField(title: "MM", placeholder: "Enter Month", txt: $payVM.txtCardMonth,keyboardType: .numberPad)
                        
                        LineTextField(title: "YYYY", placeholder: "Enter Year", txt: $payVM.txtCardYear,keyboardType: .numberPad)
                        
                    }
                    
                    RoundButton(title: "Add Payment Method") {
                        payVM.serviceCallAdd{
                            self.mode.wrappedValue.dismiss()
                        }
                    }
                    
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
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
                    
                    Text("Add Payment Method")
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
        .alert(isPresented: $payVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(payVM.errorMessage), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        AddPaymentMethodView()
    }
}
