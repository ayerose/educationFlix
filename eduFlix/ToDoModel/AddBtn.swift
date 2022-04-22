//
//  AddBtn.swift
//  eduFlix
//
//  Created by Reya on 14.04.22.
//

import SwiftUI

struct AddBtn: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50)
            
               // .foregroundColor(Color(hue: 1.028, saturation: 0.796, brightness: 0.408)))
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            
            Text("+")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                                    
        }
        .frame(height: 50)
    }
}

struct AddBtn_Previews: PreviewProvider {
    static var previews: some View {
        AddBtn()
    }
}
