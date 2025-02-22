//
//  PaymentViewModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 22/2/25.
//

import SwiftUI

class PaymentViewModel: ObservableObject
{
    static var shared: PaymentViewModel = PaymentViewModel()
    
    @Published var txtName: String = ""
    @Published var txtCardNumber: String = ""
    @Published var txtCardMonth: String = ""
    @Published var txtCardYear: String = ""

    @Published var showError = false
    @Published var errorMessage = ""
    
    
    @Published var listArr: [PaymentModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    func clearAll() {
        self.txtName = ""
        self.txtCardNumber = ""
        self.txtCardMonth = ""
        self.txtCardYear = ""
    }
    
    func setData(card: PaymentModel) {
        txtName = card.name
        txtCardNumber = card.cardNumber
        txtCardMonth = card.cardMonth
        txtCardYear = card.cardYear
    }
    
    func serviceCallList() {
        ServiceCall.post(parameters: [:], path: Globs.SV_PAYMENT_METHOD_LIST, requiresToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({obj in
                        return PaymentModel(dict: obj as? NSDictionary ?? [:])
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
    
    func serviceCallRemove(cObj: PaymentModel) {
        ServiceCall.post(parameters: ["pay_id": cObj.id], path: Globs.SV_REMOVE_PAYMENT_METHOD, requiresToken: true) { responseObj in
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
        func serviceCallAdd(didDone: (() -> ())?) {
            if(txtName.isEmpty) {
                errorMessage = "please enter name"
                showError = true
                return
            }
            
            if(txtCardNumber.count != 16) {
                errorMessage = "please enter valid card number"
                showError = true
                return
            }
            
            if(txtCardMonth.count != 2) {
                errorMessage = "please enter valid card month"
                showError = true
                return
            }
            
            if(txtCardYear.count != 4) {
                errorMessage = "please enter valid card year"
                showError = true
                return
            }
                
            ServiceCall.post(parameters: ["name": txtName, "card_number": txtCardNumber,"card_month": txtCardMonth, "card_year": txtCardYear], path: Globs.SV_ADD_PAYMENT_METHOD, requiresToken: true) { responseObj in
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
