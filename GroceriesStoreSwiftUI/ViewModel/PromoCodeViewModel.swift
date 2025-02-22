//
//  PromoCodeViewModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 22/2/25.
//

import SwiftUI

class PromoCodeViewModel: ObservableObject
{
    static var shared: PromoCodeViewModel = PromoCodeViewModel()
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    
    @Published var listArr: [PromoCodeModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    func serviceCallList() {
        ServiceCall.post(parameters: [:], path: Globs.SV_PROMO_CODE_LIST, requiresToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({obj in
                        return PromoCodeModel(dict: obj as? NSDictionary ?? [:])
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
}
