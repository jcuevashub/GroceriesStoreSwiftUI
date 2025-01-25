//
//  SearchTextField.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 25/1/25.
//

import SwiftUI

struct SearchTextField: View {
    @State var placeholder: String = "Placeholder"
    @Binding var txt: String

    var body: some View {
        HStack(spacing: 15) {
            
            Image("search")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            TextField(placeholder, text: $txt)
                .font(.customfont(.regular, fontSize: 17))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .frame(height: 30)
        .padding(15)
        .background(Color(hex: "F2F3F2"))
        .cornerRadius(16)
    }
}

#Preview {
    SearchTextField(placeholder: "Search Store", txt: .constant(""))
        .padding(15)
}
