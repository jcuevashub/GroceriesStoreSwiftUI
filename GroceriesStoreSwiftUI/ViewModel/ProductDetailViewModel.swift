//
//  ProductDetailViewModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 26/1/25.
//

import SwiftUI

class ProductDetailViewModel: ObservableObject
{
    @Published var product: ProductModel = ProductModel(dict: [:])
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var nutritionArr: [NutritionModel] = []
    @Published var imageArr: [ImageModel] = []

    @Published var isFav: Int = 0
    @Published var isShowDetail: Bool = false
    @Published var isShowNutrition: Bool = false
    @Published var qty: Int = 1
    
    func showDetail() {
        isShowDetail = !isShowDetail
    }
    
    
    func showNutrition() {
        isShowNutrition = !isShowNutrition
    }
    
    func addSubQty(isAdd: Bool = true) {
        if(isAdd) {
            qty += 1
            if(qty > 99) {
                qty = 99
            }
        } else {
            qty -= 1
            if(qty < 1) {
                qty = 1
            }
        }
    }
    
    init(prodObj: ProductModel) {
        self.product = prodObj
        self.isFav = prodObj.isFav
        serviceCallDetail()
    }
    
    func serviceCallDetail() {
        ServiceCall.post(parameters: ["prod_id": self.product.prodId], path: Globs.SV_PRODUCT_DETAIL, requiresToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary {
    
                        self.product = ProductModel(dict: payloadObj)
                        
                        self.nutritionArr = (payloadObj.value(forKey: "nutrition_list") as? NSArray ?? []).map({obj in
                            return NutritionModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        self.imageArr = (payloadObj.value(forKey: "images") as? NSArray ?? []).map({obj in
                            return ImageModel(dict: obj as? NSDictionary ?? [:])
                        })
                    }
                } else {
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true

        }
    }
}
