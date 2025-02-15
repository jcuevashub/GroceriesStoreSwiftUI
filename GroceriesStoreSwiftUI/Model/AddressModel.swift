//
//  AddressModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 15/2/25.
//

import SwiftUI

struct AddressModel: Identifiable, Equatable {
    let id: Int
    let name: String
    let phone: String
    let address: String
    let city: String
    let state: String
    let typeName: String
    let postalCode: String
    let isDefault: Int


    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "address_id") as? Int ?? 0
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.phone = dict.value(forKey: "phone") as? String ?? ""
        self.address = dict.value(forKey: "address") as? String ?? ""
        self.city = dict.value(forKey: "city") as? String ?? ""
        self.state = dict.value(forKey: "state") as? String ?? ""
        self.typeName = dict.value(forKey: "type_name") as? String ?? ""
        self.postalCode = dict.value(forKey: "postal_code") as? String ?? ""
        self.isDefault = dict.value(forKey: "is_default") as? Int ?? 0
    }

    static func == (lhs: AddressModel, rhs: AddressModel) -> Bool {
        return lhs.id == rhs.id
    }
}
