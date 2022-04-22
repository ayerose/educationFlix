//
//  ButtonView.swift
//  eduFlix
//
//  Created by Reya on 18.04.22.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            HStack {
                
                Spacer()
                Text("Login")
                    .bold()
                    .foregroundColor(Color.white)
                Spacer()
                
            }.padding().background(Color.orange).cornerRadius(5).shadow(radius: 10).padding()
            
        })
    }
}
    
