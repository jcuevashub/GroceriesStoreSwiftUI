//
//  SignInView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 5/3/24.
//

import SwiftUI

struct SignInView: View {
    @State var txtMobile: String = ""
    
    var body: some View {
        ZStack {
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack {
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenWidth)
                
                Spacer()
            }
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Get your groceries\nwith nectar")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 25)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Image("")
                            
                            Text("+91")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.primaryText)
                        }
                        
                        TextField("Enter Mobile", text: $txtMobile)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    }
                    
                    Divider()
                        .padding(.bottom, 25)
                    
                    Text("Or connect with social media")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.textTitlte)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.bottom, 25)
                    
                    Button {
                        
                    } label: {
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Continue with Google")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom, 8)
                    
                    Button {
                        
                    } label: {
                        Image("fb_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Continue with Facebook")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color(hex: "4A66AC"))
                    .cornerRadius(20)
                    .padding(.bottom, 8)
                
                    
                }
                .padding(.horizontal, 20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth * 0.7)
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SignInView()
}
