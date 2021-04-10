//
//  SecondView.swift
//  Weather-API
//
//  Created by Rushi Patel on 2021-04-05.
//

import UIKit
import Combine
class SecondView: UIViewController {
    var currentNO: Int = 1
    private let weathersFetcher = WeathersFetcher.getInstance()
    private var weatherList : Weather = Weather()
    private var cancellables: Set<AnyCancellable> = []
    @IBOutlet var lblTime : UILabel!
    @IBOutlet var lblName : UILabel!
    @IBOutlet var lblTempC : UILabel!
    @IBOutlet var lblFeels : UILabel!
    @IBOutlet var lblwind : UILabel!
    @IBOutlet var lblwind_kph : UILabel!
    @IBOutlet var lblUv : UILabel!
    @IBOutlet var lbltext : UILabel!
    @IBOutlet var imageIcon : UIImageView!
    @IBOutlet var img :UIImageView!
    var yourArray = [String](arrayLiteral: "Mumbai","Delhi", "Ahemdabad" , "Toronto","Tokyo", "Moscow","Sydney","Amsterdam","London","Cairo")

    override func viewDidLoad() {
        super.viewDidLoad();
        currentNO = viewNo;
        getRandomImage();
        self.weathersFetcher.fetchDataFromAPI(loc: yourArray[currentNO - 1]);
        self.receiveChanges()
    }
    func getRandomImage(){
      
        img.image = UIImage(named: "image_\(currentNO)")
        }
    private func receiveChanges(){
        self.weathersFetcher.$weatherList.receive(on: RunLoop.main)
            .sink{ (weather) in
                print(#function, "Received Weather : ", weather)
                self.weatherList = weather
                print("here it goes");
                print(self.weatherList)
                print(weather);
               self.lblName.text = self.weatherList.name
                
                self.lblTime.text = self.weatherList.last_updated
                self.lblTempC.text = String(self.weatherList.temp_c)+"°"

                self.lblFeels.text = String(self.weatherList.feelslike_c)+"°"
                self.lblwind.text = self.weatherList.wind_dir
                self.lblwind_kph.text = String(self.weatherList.wind_kph)
                self.lblUv.text = String(self.weatherList.uv)

                self.lbltext.text = self.weatherList.mist
                self.imageIcon.image = UIImage(url: URL(string:  "https:" + self.weatherList.icon))
                
                
            }
            .store(in : &cancellables)
    }
    
}
extension UIImage { // For image decoding in
    convenience init?(url: URL?) {
        guard let url = url else { return nil }
        
        do {
            self.init(data: try Data(contentsOf: url))
        } catch {
            print("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
}
