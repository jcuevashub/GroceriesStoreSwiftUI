//
//  MyOrderModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 1/3/25.
//

import SwiftUI

struct MyOrderModel: Identifiable, Equatable {
    let id: Int
    let cartId: String
    let totalPrice: Double
    let userPayPrice: Double?
    let discountPrice: Double?
    let deliverPrice: Double?
    
    let deliverType: Int
    let paymentType: Int
    let paymentStatus: Int
    let orderStatus: Int
    let status: Int
    
    let names: String
    let userName: String
    let phone: String
    let address: String
    let city: String
    let state: String
    let postalCode: String
    let images: [String]
    var createdDate: Date = Date()
    


    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "order_id") as? Int ?? 0
        self.cartId = dict.value(forKey: "cart_id") as? String ?? ""
        
        self.totalPrice = dict.value(forKey: "total_price") as? Double ?? 0.0
        self.userPayPrice = dict.value(forKey: "user_pay_price") as? Double ?? 0.0
        self.discountPrice = dict.value(forKey: "discount_price") as? Double ?? 0.0
        self.deliverPrice = dict.value(forKey: "deliver_price") as? Double ?? 0.0
        
        self.deliverType = dict.value(forKey: "deliver_type") as? Int ?? 0
        self.paymentType = dict.value(forKey: "payment_type") as? Int ?? 0
        self.paymentStatus = dict.value(forKey: "payment_status") as? Int ?? 0
        self.orderStatus = dict.value(forKey: "order_status") as? Int ?? 0
        self.status = dict.value(forKey: "status") as? Int ?? 0
        
        self.names = dict.value(forKey: "names") as? String ?? ""
        self.userName = dict.value(forKey: "user_name") as? String ?? ""
        self.phone = dict.value(forKey: "phone") as? String ?? ""
        self.address = dict.value(forKey: "address") as? String ?? ""
        self.city = dict.value(forKey: "city") as? String ?? ""
        self.state = dict.value(forKey: "state") as? String ?? ""
        self.postalCode = dict.value(forKey: "postal_code") as? String ?? ""
    
        self.images = (dict.value(forKey: "images") as? String ?? "").components(separatedBy: ",")
        self.createdDate = (dict.value(forKey: "created_date") as? String ?? "").stringDateToDate() ?? Date()

    }

    static func == (lhs: MyOrderModel, rhs: MyOrderModel) -> Bool {
        return lhs.id == rhs.id
    }
}

