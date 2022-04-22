//
//  PasswordView.swift
//  eduFlix
//
//  Created by Reya on 18.04.22.
//

import SwiftUI

struct PasswordView: View {
    @Binding var password : String
    var body: some View {
        HStack {
            Image(systemName: "lock.fill")
                .foregroundColor(Color.gray)
            TextField("Password..", text: $password)
            
        }.padding().border(Color.init(white: 0.9)).padding([.leading, .trailing, .top])
    }
}


