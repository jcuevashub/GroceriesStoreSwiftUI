//
//  UserModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 4/4/24.
//

import SwiftUI

struct UserModel: Identifiable, Equatable {
    
    var id: Int = 0
    var userName: String = ""
    var name: String = ""
    var email: String = ""
    var mobile: String = ""
    var mobileCode: String = ""
    var authToken: String = ""
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "user_id") as? Int ?? 0
        self.userName = dict.value(forKey: "userName") as? String ?? ""
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.email = dict.value(forKey: "email") as? String ?? ""
        self.mobile = dict.value(forKey: "mobile") as? String ?? ""
        self.mobileCode = dict.value(forKey: "mobileCode") as? String ?? ""
        self.authToken = dict.value(forKey: "authToken") as? String ?? ""
    }
    
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.id == rhs.id
    }
}
