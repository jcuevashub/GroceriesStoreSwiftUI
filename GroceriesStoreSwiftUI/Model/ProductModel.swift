//
//  ProductModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 26/1/25.
//

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
    let image: String
    let catName: String
    let typeName: String
    let isFav: Int
    let avgRating: Int
    
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
        self.image = dict.value(forKey: "image") as? String ?? ""
        self.catName = dict.value(forKey: "cat_name") as? String ?? ""
        self.typeName = dict.value(forKey: "type_name") as? String ?? ""
        self.isFav = dict.value(forKey: "is_fav") as? Int ?? 0
        self.avgRating = dict.value(forKey: "avg_rating") as? Int ?? 0
    }

    static func == (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return lhs.id == rhs.id
    }
}
