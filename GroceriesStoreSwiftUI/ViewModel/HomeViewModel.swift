//
//  HomeViewModel.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 25/1/25.
//

import SwiftUI

class HomeViewModel: ObservableObject
{
    static var shared: HomeViewModel = HomeViewModel()
    
    @Published var selecTab: Int = 0
    @Published var txtSearch: String = ""
}
