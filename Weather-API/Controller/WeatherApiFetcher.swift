//
//  WeatherApiFetcher.swift
//  Weather-API
//
//  Created by Rushi Patel on 2021-04-08.
//

import Foundation


class WeathersFetcher : ObservableObject{
    
    var apiURL = "https://api.weatherapi.com/v1/current.json?key=280480ca8aea410ebba183152210904&q="
    
    @Published var weatherList = Weather()
    private static var shared : WeathersFetcher?
    
    static func getInstance() -> WeathersFetcher{
        if shared != nil{
            return shared!
        }else{
            return WeathersFetcher()
        }
        
    }
    func fetchDataFromAPI(loc: String){
        apiURL += loc
        apiURL += "&aqi=no"
        guard let api = URL(string: apiURL) else{
            return
        }
        URLSession.shared.dataTask(with: api){(data: Data?, response: URLResponse?, error : Error?) in
            
            if let err = error{
                print(#function, "Couldn't fetch data", err)
            }else{
                DispatchQueue.global().async{
                    do{
                        if let jsonData = data{
                            let decoder = JSONDecoder()
                            let decodedList = try decoder.decode(Weather.self, from: jsonData)
                            DispatchQueue.main.async {
                                self.weatherList = decodedList
                            }
                        }else{
                            print(#function, "No data found!!")
                        }
                    }catch  let error{
                        print(#function, error)
                    }
                }
            }
            
        }.resume()
    }
}
