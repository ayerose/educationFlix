//
//  EmailView.swift
//  eduFlix
//
//  Created by Reya on 18.04.22.
//

import SwiftUI

struct EmailView: View {

    @Binding var email : String
     var body: some View {
         HStack { //
             Image(systemName: "envelope.fill")
                 .foregroundColor(Color.gray)
             TextField("eMail..", text: $email)
             
         }.padding().border(Color.init(white: 0.9)).padding([.leading, .trailing, .top])
     }
 }
