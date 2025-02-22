//
//  PaymentModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 22/2/25.
//

import SwiftUI

struct PaymentModel: Identifiable, Equatable {
    let id: Int
    let name: String
    let cardNumber: String
    let cardMonth: String
    let cardYear: String

    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "pay_id") as? Int ?? 0
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.cardNumber = dict.value(forKey: "card_number") as? String ?? ""
        self.cardMonth = dict.value(forKey: "card_month") as? String ?? ""
        self.cardYear = dict.value(forKey: "card_year") as? String ?? ""
    }

    static func == (lhs: PaymentModel, rhs: PaymentModel) -> Bool {
        return lhs.id == rhs.id
    }
}
