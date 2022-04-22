//
//  ConsentView.swift
//  eduFlix
//
//  Created by Reya on 19.04.22.
//

import SwiftUI
import CoreLocationUI

struct ConsentView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        
        VStack {
            VStack(spacing: 20) {
                Text("My Weather")
                    .bold().font(.title)
                
                Text("Please agree to share your location to get weather details in your city")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
                
            }
            .cornerRadius(35)
            .symbolVariant(.fill)
            
            .foregroundColor(.white)
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ConsentView_Previews: PreviewProvider {
    static var previews: some View {
        ConsentView()
    }
}
