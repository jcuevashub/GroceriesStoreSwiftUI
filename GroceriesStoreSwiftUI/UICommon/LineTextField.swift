//
//  LineTextField.swift
//  GroceriesStoreSwiftUI
//
//  Created by Jackson Cuevas on 5/3/24.
//

import SwiftUI

struct LineTextField: View {
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    @Binding var txt: String
    @State var keyboardType: UIKeyboardType = .default
    @State var isPassword: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.secondary)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if(isPassword) {
                SecureField(placeholder, text: $txt)

            } else {
                TextField(placeholder, text: $txt)
                    .keyboardType(keyboardType)
            }
            Divider()
        }
    }
}

struct LineSecureField: View {
    @State var title: String = "Title"
    @State var placeholder: String = "Placeholder"
    @Binding var txt: String
    @Binding var isShowPassword: Bool

    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.secondary)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if(isShowPassword) {
                TextField(placeholder, text: $txt)
                    .modifier(ShowButton(isShow: $isShowPassword))

            } else {
                SecureField(placeholder, text: $txt)
                    .modifier(ShowButton(isShow: $isShowPassword))
            }
            Divider()
        }
    }
}

struct LineTextField_Prview: PreviewProvider {
    @State static var txt: String = ""
    static var previews: some View {
        LineTextField(txt: $txt)
            .padding(20)
    }
}
