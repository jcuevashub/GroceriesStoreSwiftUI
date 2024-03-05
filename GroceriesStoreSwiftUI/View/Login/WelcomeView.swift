//
//  WelcomeView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 5/3/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("welcom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack {
                Spacer()
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 8)
                
                Text("Welcome\nto our store")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text("Get your groceries in as fast as one hour")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                RoundButton(title: "Get Started") {
                    
                }
//                Button {
//                    
//                } label: {
//                    Text("Get Started")
//                        .font(.customfont(.semibold, fontSize: 18))
//                        .foregroundColor(.white)
//                        .multilineTextAlignment(.center)
//                }
//                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
//                .background(Color.primaryApp)
//                .cornerRadius(20)
                
                Spacer()
                    .frame(height: 80)
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView()
}
