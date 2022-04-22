//
//  LoginView.swift
//  eduFlix
//
//  Created by Reya on 18.04.22.
//

import SwiftUI

struct LoginView: View {
    // state checks if input is given in mail and pw
    @State var email : String = ""
    @State var password : String = ""
    
    var body: some View {
        NavigationView {
            VStack {
               // Spacer()
                LoginHeaderView()
              //  Spacer()
                //Divider()
                EmailView(email: $email)
                PasswordView(password: $password)
             
                Spacer()
               // Divider()
                //navigation
                NavigationLink(destination: HomeView()) {
                   ButtonView()
                }
              
                
                
        }
            
        }.accentColor(Color.orange)

}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}




