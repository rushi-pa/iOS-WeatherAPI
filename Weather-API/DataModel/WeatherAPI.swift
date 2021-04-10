//
//  WeatherAPI.swift
//  Weather-API
//
//  Created by Rushi Patel on 2021-04-08.
//

import Foundation

struct Weather : Codable{
    var name : String //city name
    var last_updated : String  // last upadete field
    var temp_c : Double  //temp in celcius
    var wind_kph : Double
    var uv : Double  //uv index
    var mist : String //mist
    var icon : String  // icon of weather
    var feelslike_c : Double  //feelslike in c
    var wind_dir : String //Direction of wind
    
    init(){
        self.name = ""
        self.last_updated = ""
        self.temp_c = 0.0
        self.feelslike_c = 0.0
        self.mist = ""
        self.wind_dir = ""
        self.wind_kph = 0.0
        self.uv = 0.0
        self.icon = ""
    }
    
    enum CodingKeys : String, CodingKey{
        case name = "name"
        case location = "location"
        case last_updated = "last_updated"
        case temp_c = "temp_c"
        case feelslike_c = "feelslike_c"
        case mist = "text"
        case wind_dir = "wind_dir"
        case wind_kph = "wind_kph"
        case uv = "uv"
        case current = "current"
        case icon = "icon"
       
    }
    
    init(from decoder: Decoder) throws{
        let response = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name  = ""
        let locationContainer = try response.decodeIfPresent(Location.self, forKey: .location)
        self.name = locationContainer?.name ?? "Unavailable"
        self.last_updated  = ""
        self.temp_c  = 0.0
        self.feelslike_c  = 0.0
        self.wind_dir = ""
        self.wind_kph = 0.0
        self.uv = 0.0
        let currentContainer = try response.decodeIfPresent(Current.self, forKey: .current)
        self.last_updated = currentContainer?.last_updated ?? "Unavailable"
        self.temp_c = currentContainer?.temp_c ?? 0
        
        
        self.mist = ""
        self.icon = ""
        self.mist = currentContainer?.mist ?? "Unavailable"
        self.icon = currentContainer?.icon ?? "Unavailable"
        
        
        self.feelslike_c = currentContainer?.feelslike_c ?? 0.0
        self.wind_dir = currentContainer?.wind_dir ?? "Unavailable"
        self.wind_kph = currentContainer?.wind_kph ??  0.0
        self.uv = currentContainer?.uv ?? 0.0
        
    }
    
    func encode(to encoder: Encoder) throws {
        //nothing to encode
    }
}

struct Location : Codable{
    let name : String
    let region : String
    let country : String
    
    
    enum CodingKeys: String, CodingKey{
        case name = "name"
        case region = "region"
        case country = "country"
        
    }
    
    init(from decoder: Decoder) throws{
        let response = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try response.decodeIfPresent(String.self, forKey: .name) ?? "Unavailable"
        self.region = try response.decodeIfPresent(String.self, forKey: .region) ?? "Unavailable"
        self.country = try response.decodeIfPresent(String.self, forKey: .country) ?? "Unavailable"
    }
    
    func encode(to encoder: Encoder) throws {
        //nothing to encode
    }
    
    
}

struct Current : Codable{
    let last_updated : String
    let temp_c : Double
    let feelslike_c : Double
    var wind_dir : String
    let wind_kph : Double
    let uv : Double
    
    var mist : String
    var icon : String
    
    init(){
        self.last_updated = ""
        self.temp_c = 0.0
        self.feelslike_c = 0.0
        self.wind_dir = ""
        self.wind_kph = 0.0
        self.uv = 0.0
        self.mist = ""
        self.icon = ""
    }
    
    
    enum CodingKeys: String, CodingKey{
        case last_updated = "last_updated"
        case temp_c = "temp_c"
        case feelslike_c = "feelslike_c"
        case uv = "uv"
        case wind_dir = "wind_dir"
        case wind_kph = "wind_kph"
        
        case mist = "text"
        case icon = "icon"
        case condition = "condition"
    }
    
    init(from decoder: Decoder) throws{
        let response = try decoder.container(keyedBy: CodingKeys.self)
        self.last_updated = try response.decodeIfPresent(String.self, forKey: .last_updated) ?? "Unavailable"
        self.temp_c = try response.decodeIfPresent(Double.self, forKey: .temp_c) ?? 0.0
        self.feelslike_c = try response.decodeIfPresent(Double.self, forKey: .feelslike_c) ?? 0.0
        self.wind_dir = try response.decodeIfPresent(String.self, forKey: .wind_dir) ?? "Unavailable"
        self.wind_kph = try response.decodeIfPresent(Double.self, forKey: .wind_kph) ?? 0.0
        self.uv = try response.decodeIfPresent(Double.self, forKey: .uv) ?? 0.0
        
        self.mist = ""
        self.icon = ""
        let conditionContainer = try response.decodeIfPresent(Condition.self, forKey: .condition)
        self.mist = conditionContainer?.mist ?? "Unavailable"
        self.icon = conditionContainer?.icon ?? "Unavailable"
    }
    
    func encode(to encoder: Encoder) throws {
        //nothing to encode
    }
    
    
}

struct Condition : Codable{
    let mist : String
    let icon : String
    
    
    enum CodingKeys: String, CodingKey{
        case mist = "text"
        case icon = "icon"
    }
    
    init(from decoder: Decoder) throws{
        let response = try decoder.container(keyedBy: CodingKeys.self)
        self.mist = try response.decodeIfPresent(String.self, forKey: .mist) ?? "Unavailable"
        self.icon = try response.decodeIfPresent(String.self, forKey: .icon) ?? "Unavailable"
        
    }
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}
