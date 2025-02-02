//
//  ExploreCategoryModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 2/2/25.
//

import SwiftUI

struct ExploreCategoryModel: Identifiable, Equatable {
    let id: Int
    let catName: String
    let image: String
    var color: Color = Color.primaryApp

    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "cat_id") as? Int ?? 0
        self.catName = dict.value(forKey: "cat_name") as? String ?? ""
        self.image = dict.value(forKey: "image") as? String ?? ""
        self.color = Color(hex: dict.value(forKey: "color") as? String ?? "000000")
    }

    static func == (lhs: ExploreCategoryModel, rhs: ExploreCategoryModel) -> Bool {
        return lhs.id == rhs.id
    }
}
