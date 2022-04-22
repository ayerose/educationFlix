//
//  UserNameView.swift
//  eduFlix
//
//  Created by Reya on 18.04.22.
//

import SwiftUI

struct UserNameView: View { //
    
   @Binding var username : String
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .foregroundColor(Color.gray)
            TextField("username..", text: $username)
            
        }.padding().border(Color.init(white: 0.9)).padding([.leading, .trailing, .top])
    }
}
