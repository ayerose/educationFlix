//
//  LoginHeaderView.swift
//  eduFlix
//
//  Created by Reya on 18.04.22.
//

import SwiftUI


struct LoginHeaderView: View {
    var body: some View {
        Group {
            
            Image("1")
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 300 , height: 300)
            Text("Your learning platform tailored to your needs. education.flix is your #1 tool to achieve your learning goals."
            )
                .padding()
                .multilineTextAlignment(.center)
                .foregroundColor(Color.gray)
            // .font(.subheadline)
            
        }
    }
}
