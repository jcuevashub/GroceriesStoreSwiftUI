//
//  ImageModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 26/1/25.
//

import SwiftUI

struct ImageModel: Identifiable, Equatable {
    var id: Int = 0
    var prodId: Int = 0
    var image: String = ""

    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "id") as? Int ?? 0
        self.image = dict.value(forKey: "image") as? String ?? ""
        self.prodId = dict.value(forKey: "prod_id") as? Int ?? 0
    }

    static func == (lhs: ImageModel, rhs: ImageModel) -> Bool {
        return lhs.id == rhs.id
    }
}
