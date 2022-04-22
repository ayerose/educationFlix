//
//  FetchWeatherData.swift
//  eduFlix
//
//  Created by Reya on 19.04.22.
//

import Foundation
import CoreLocationUI
import CoreLocation

class FetchWeatherData {
    // MARK: API Request
    // request to get  current weather depending on the coordinates we got from LocationManager
    
    func getWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody{
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=f9985629d185e869415148207dc80b52&units=metric") else {
            fatalError("URL missing")
        }
        let urlRequest = URLRequest(url:url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error questing weather data")}
        // decode
     
        let decoder = JSONDecoder()
        // in decodeData are the decoded data
        let decodeData =  try decoder.decode(ResponseBody.self, from: data)
        
        return decodeData
    }
}

// Model of the response body
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}

