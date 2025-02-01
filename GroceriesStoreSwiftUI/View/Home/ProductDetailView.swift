//
//  ProductDetailView.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 26/1/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var detailVM: ProductDetailViewModel = ProductDetailViewModel(prodObj: ProductModel(dict: [:]))
    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(hex: "F2F2F2"))
                        .frame(width: .screenWidth, height: .screenWidth * 0.8)
                        .cornerRadius(20, corner: [.bottomLeft, .bottomRight])
                    
                    WebImage(url: URL(string: detailVM.product.image))
                        .resizable()
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width: .screenWidth * 0.8, height: .screenWidth * 0.8)
                    
                }.frame(width: .screenWidth, height: .screenWidth * 0.8)
                
                VStack {
                    HStack {
                        Text(detailVM.product.name)
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            detailVM.serviceCallAddRemoveFav()
                        } label: {
                            Image(detailVM.isFav ? "favorite": "fav")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .foregroundColor(Color.secondary)
                    }
                    Text("\(detailVM.product.unitValue)\(detailVM.product.unitName), Price")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondary)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    HStack {
                        Button {
                            detailVM.addSubQty(isAdd: false)
                        } label: {
                            Image("subtack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        
                        Text("\(detailVM.qty)")
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 45, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.placeholder.opacity(0.5), lineWidth: 1)
                            )
                        
                        Button {
                            detailVM.addSubQty(isAdd: true)
                        } label: {
                            Image("add_green")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        
                        
                        Spacer()
                        Text("$\((detailVM.product.price) * Double(detailVM.qty), specifier: "%.2f")")
                            .font(.customfont(.bold, fontSize: 28))
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical, 20)
                    
                    Divider()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                VStack {
                    HStack {
                        Text("Product Detail")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            withAnimation {
                                detailVM.showDetail()
                            }
                        } label: {
                            Image(detailVM.isShowDetail ? "detail_open": "next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)
                    }
                    
                    if(detailVM.isShowDetail) {
                        Text(detailVM.product.detail)
                            .font(.customfont(.medium, fontSize: 13))
                            .foregroundColor(.secondary)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                    }
                    
                    Divider()
                }
                .padding(.horizontal, 20)
                
                VStack {
                    HStack {
                        Text("Nutritions")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Text(detailVM.product.nutritionWeight)
                            .font(.customfont(.semibold, fontSize: 10))
                            .foregroundColor(.secondary)
                            .padding(8)
                            .background(Color.placeholder.opacity(0.5))
                        
                        Button {
                            withAnimation {
                                detailVM.showNutrition()
                            }
                        } label: {
                            Image(detailVM.isShowNutrition ? "detail_open": "next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)
                    }
                    
                    if(detailVM.isShowNutrition) {
                        LazyVStack {
                            ForEach(detailVM.nutritionArr, id: \.id) { nObj in
                                HStack {
                                    //                                    Text(nObj.nutritionName)
                                    //                                        .font(.customfont(.semibold, fontSize: 15))
                                    //                                        .foregroundColor(.secondaryText)
                                    //                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    //
                                    //                                    Text(nObj.nutritionValue)
                                    //                                        .font(.customfont(.semibold, fontSize: 15))
                                    //                                        .foregroundColor(.primaryText)
                                }
                                Divider()
                            }.padding(.vertical, 0)
                        }
                        .padding(.horizontal, 10)
                        
                    }
                    Divider()
                }
                .padding(.horizontal, 20)
                
                HStack {
                    Text("Review")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 2)
                    {
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.orange)
                                .frame(width: 15, height: 15)
                            
                        }
                    }
                    Button {
                     
                    } label: {
                        Image("next")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .padding(15)
                    }
                    .foregroundColor(Color.primaryText)
                }
                .padding(.horizontal, 20)
                
                RoundButton(title: "Add to Cart") {
                    
                }
                .padding(20)

            }
            VStack {
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    Spacer()
                    Button {
                    } label: {
                        Image("share")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                }
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
            
        }
        .alert(isPresented: $detailVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(detailVM.errorMessage), dismissButton: .default(Text("OK")))
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corner: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corner))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        return Path(path.cgPath)
    }
    
    
}

#Preview {
    ProductDetailView(detailVM: ProductDetailViewModel(prodObj: ProductModel(dict: [  "prod_id": 6,
                                                                                      "cat_id": 1,
                                                                                      "brand_id": 1,
                                                                                      "type_id": 1,
                                                                                      "name": "Red Apple",
                                                                                      "detail": "Apples contain key nutrients, including fiber and antioxidants. They may offer health benefits, including lowering blood sugar levels and benefitting heart health.",
                                                                                      "unit_name": "kg",
                                                                                      "unit_value": "1",
                                                                                      "nutrition_weight": "182g",
                                                                                      "price": 1.99,
                                                                                      "created_date": "2023-07-31T09:51:36.000Z",
                                                                                      "modify_date": "2023-07-31T09:51:36.000Z",
                                                                                      "cat_name": "Frash Fruits & Vegetable",
                                                                                      "is_fav": 0,
                                                                                      "brand_name": "bigs",
                                                                                      "type_name": "Pulses",
                                                                                      "offer_price": 1.99,
                                                                                      "image": "http://localhost:3001/img/product/202307310951365136W6nJvPCdzQ.png",
                                                                                      "start_date": "",
                                                                                      "end_date": "",
                                                                                      "is_offer_active": 0,
                                                                                      "avg_rating": 0,
                                                                                      "nutrition_list": [
                                                                                        "id": 1,
                                                                                        "nutrition_name": "Hola",
                                                                                        "nutrition_value": "Hola2"
                                                                                      ],
                                                                                      "images": [
                                                                                        
                                                                                      ],
                                                                                      "review_list": []])))
}
