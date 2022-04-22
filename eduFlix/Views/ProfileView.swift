//
//  ProfileView.swift
//  eduFlix
//
//  Created by Reya on 13.04.22.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var enableNotification: Bool = true
    @State private var backgroundRefresh: Bool = false
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // MARK:- HEADER
            VStack(alignment: .center, spacing: 5) {
                Image("2")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 300, height: 300, alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)
                
//                Text("Education.Flix".uppercased())
//                    .font(.system(.title, design: .rounded))
//                    .fontWeight(.bold)
//                    .foregroundColor(Color("Pink"))
            }
            .padding()
            
            Form {
               
                Section(header: Text("General Settings")) {
                    Toggle(isOn: $enableNotification) {
                        Text("Enable notification")
                    }
                    
                    Toggle(isOn: $backgroundRefresh) {
                        Text("Background Refresh")
                    }
                }
              
                Section(header: Text("Application")) {
                    if enableNotification {
                        HStack {
                            Text("Product").foregroundColor(Color.gray)
                            Spacer()
                            Text("Education.Flix")
                        }
                        HStack {
                            Text("Compatibility").foregroundColor(Color.gray)
                            Spacer()
                            Text("iPhone")
                        }
                        HStack {
                            Text("Developer").foregroundColor(Color.gray)
                            Spacer()
                            Text("Reya")
                        }
                        HStack {
                            Text("Designer").foregroundColor(Color.gray)
                            Spacer()
                            Text("Reya")
                        }
                        HStack {
                            Text("Code").foregroundColor(Color.gray)
                            Spacer()
                            Text("")
                        }
                        HStack {
                            Text("Version").foregroundColor(Color.gray)
                            Spacer()
                            Text("1.0")
                        }
                    } else {
                        HStack {
                            Text("Personal Message")
                                .foregroundColor(Color.gray)
                            Spacer()
                            Text("Have a nice Day!  ")
                        }
                    }
                    
                }
               
                
            }
            
        }
        
        .frame(maxWidth: 640)
    }
      
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
