//
//  TypeModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 26/1/25.
//

import SwiftUI

struct TypeModel: Identifiable, Equatable {
    let id: Int
    let typeName: String
    let image: String
    var color: Color = Color.primaryApp

    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "type_id") as? Int ?? 0
        self.typeName = dict.value(forKey: "type_name") as? String ?? ""
        self.image = dict.value(forKey: "image") as? String ?? ""
        self.color = Color(hex: dict.value(forKey: "color") as? String ?? "000000")
    }

    static func == (lhs: TypeModel, rhs: TypeModel) -> Bool {
        return lhs.id == rhs.id
    }
}
