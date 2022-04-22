//
//  ToDoFinalView.swift
//  eduFlix
//
//  Created by Reya on 14.04.22.
//

import SwiftUI

struct ToDoFinalView: View {
    @StateObject var realmManager = RealmManager()
    
    @State private var showAddToDoView = false
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ToDosView()
                .environmentObject(realmManager)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        
       // .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.9))
      //  .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
    }
}

struct ToDoFinalView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoFinalView()
    }
}
