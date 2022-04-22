//
//  HomeView.swift
//  eduFlix
//
//  Created by Reya on 13.04.22.
//

import SwiftUI

struct HomeView: View {
  
    
    var body: some View {
        VStack {
            Image("2")
            Spacer()
            Spacer()
            Button {
//                withAnimation{
//
//                }
            } label: {
                Label("", systemImage: "calendar").foregroundColor(.blue)
                    
            }
            
            Text("Test")
                .font(.title)
            Text("Test 2")
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text("xyx")
                .lineLimit(nil)
            
            
           // Button()
         
            
            
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


