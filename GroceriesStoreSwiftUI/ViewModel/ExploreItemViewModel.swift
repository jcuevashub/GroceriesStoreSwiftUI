//
//  ExploreItemViewModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 2/2/25.
//

import SwiftUI

class ExploreItemViewModel: ObservableObject
{
    @Published var cObj: ExploreCategoryModel = ExploreCategoryModel(dict: [:])
    @Published var txtSearch: String = ""
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    
    @Published var listArr: [ProductModel] = []
    
    init(catObj: ExploreCategoryModel) {
        self.cObj = catObj
        serviceCallList()
    }
    
    func serviceCallList() {
        ServiceCall.post(parameters: ["cat_id": self.cObj.id], path: Globs.SV_EXPLORE_ITEMs_LIST, requiresToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({obj in
                        return ProductModel(dict: obj as? NSDictionary ?? [:])
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
