//
//  DeliveryAddressViewModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 15/2/25.
//

import SwiftUI

class DeliveryAddressViewModel: ObservableObject
{
    static var shared: DeliveryAddressViewModel = DeliveryAddressViewModel()
    
    @Published var txtName: String = ""
    @Published var txtMobile: String = ""
    @Published var txtAddress: String = ""
    @Published var txtCity: String = ""
    @Published var txtState: String = ""
    @Published var txtPostalCode: String = ""
    @Published var txtTypeName: String = "Home"
    
    
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    
    @Published var listArr: [AddressModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    func clearAll() {
        self.txtName = ""
        self.txtMobile = ""
        self.txtAddress = ""
        self.txtCity = ""
        self.txtState = ""
        self.txtPostalCode = ""
        self.txtTypeName = "Home"
    }
    
    func setData(address: AddressModel) {
        txtName = address.name
        txtMobile = address.phone
        txtAddress = address.address
        txtCity = address.city
        txtState = address.state
        txtPostalCode = address.postalCode
        txtTypeName = address.typeName
    }
    
    func serviceCallList() {
        ServiceCall.post(parameters: [:], path: Globs.SV_ADDRESS_LIST, requiresToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({obj in
                        return AddressModel(dict: obj as? NSDictionary ?? [:])
                    })
                    
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
    
    func serviceCallRemove(cObj: AddressModel) {
        ServiceCall.post(parameters: ["address_id": cObj.id], path: Globs.SV_REMOVE_ADDRESS, requiresToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.serviceCallList()
                    
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
    
    func serviceCallUpdateAddress(aObJ: AddressModel?, didDone: (() -> ())?) {
        ServiceCall.post(parameters: ["address_id": aObJ?.id ?? "", "name": txtName, "type_name": txtTypeName, "phone": txtMobile, "address": txtAddress, "city": txtCity, "state": txtState, "postal_code": txtPostalCode], path: Globs.SV_UPDATE_ADDRESS, requiresToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.clearAll()
                    self.serviceCallList()
                    didDone?()
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
    
    func serviceCallAddAddress(didDone: (() -> ())?) {
        ServiceCall.post(parameters: ["name": txtName, "type_name": txtTypeName, "phone": txtMobile, "address": txtAddress, "city": txtCity, "state": txtState, "postal_code": txtPostalCode], path: Globs.SV_ADD_TO_ADDRESS, requiresToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.clearAll()
                    self.serviceCallList()
                    didDone?()
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
