//
//  WeatherView.swift
//  eduFlix
//
//  Created by Reya on 19.04.22.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var locationManager = LocationManager()
   @State var weatherManager = FetchWeatherData()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
               
                if let weather = weather {
                   
                    WeatherView(weather: weather)
                    
                } else {
                    Loading()
                        .task {
                            do {
                                try await
                                weatherManager.getWeather(latitude: location.latitude, longitude: location.longitude)
                                
                            } catch {
                                print(error)
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                   // ProgressView()
                    Loading()
                } else {
                    ConsentView()
                        .environmentObject(locationManager)
                    
                }
            }
          
            
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
