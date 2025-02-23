//
//  ProductModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 26/1/25.
//

import Foundation

import Foundation

struct ProductModel: Identifiable, Equatable {
    let id: Int
    let prodId: Int
    let catId: Int
    let brandId: Int
    let typeId: Int
    let name: String
    let detail: String
    let unitName: String
    let unitValue: String
    let nutritionWeight: String
    let price: Double
    let createdDate: String
    let modifyDate: String
    let catName: String
    let isFav: Bool
    let brandName: String
    let typeName: String
    let offerPrice: Double
    let image: String
    let startDate: String
    let endDate: String
    let isOfferActive: Int
    let avgRating: Int
    let nutritionList: [NutritionModel]
    let images: [ImageModel]
    let reviewList: [String]

    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "prod_id") as? Int ?? 0
        self.prodId = dict.value(forKey: "prod_id") as? Int ?? 0
        self.catId = dict.value(forKey: "cat_id") as? Int ?? 0
        self.brandId = dict.value(forKey: "brand_id") as? Int ?? 0
        self.typeId = dict.value(forKey: "type_id") as? Int ?? 0
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.detail = dict.value(forKey: "detail") as? String ?? ""
        self.unitName = dict.value(forKey: "unit_name") as? String ?? ""
        self.unitValue = dict.value(forKey: "unit_value") as? String ?? ""
        self.nutritionWeight = dict.value(forKey: "nutrition_weight") as? String ?? ""
        self.price = dict.value(forKey: "price") as? Double ?? 0.0
        self.createdDate = dict.value(forKey: "created_date") as? String ?? ""
        self.modifyDate = dict.value(forKey: "modify_date") as? String ?? ""
        self.catName = dict.value(forKey: "cat_name") as? String ?? ""
        self.isFav = dict.value(forKey: "is_fav") as? Bool ?? false
        self.brandName = dict.value(forKey: "brand_name") as? String ?? ""
        self.typeName = dict.value(forKey: "type_name") as? String ?? ""
        self.offerPrice = dict.value(forKey: "offer_price") as? Double ?? 0.0
        self.image = dict.value(forKey: "image") as? String ?? ""
        self.startDate = dict.value(forKey: "start_date") as? String ?? ""
        self.endDate = dict.value(forKey: "end_date") as? String ?? ""
        self.isOfferActive = dict.value(forKey: "is_offer_active") as? Int ?? 0
        self.avgRating = dict.value(forKey: "avg_rating") as? Int ?? 0
        self.nutritionList = dict.value(forKey: "nutrition_list") as? [NutritionModel] ?? []
        self.images = (dict.value(forKey: "images") as? [ImageModel] ?? [])
        self.reviewList = dict.value(forKey: "review_list") as? [String] ?? []
    }

    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return lhs.id == rhs.id
    }
}
