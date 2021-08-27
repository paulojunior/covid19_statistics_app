//
//  CovidRequest.swift
//  covid19_statistics_app
//
//  Created by Junior Ferreira on 26/08/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class CovidRequest: ObservableObject {
    
    @Published var allCountry: [CountryData] = []
    @Published var totalData: TotalData = TotalData(confirmed: 200, critical: 5, deaths: 2, recovered: 198)
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59"
    ]
    
    init() {
        getAllCounties()
        getCurrentTotal()
    }
    
    func getCurrentTotal() {
        
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=undefined", headers: headers).responseJSON { response in
            let result = response.data
            
            if result != nil {
                let json = JSON(result!)
                let confirmed = json[0]["confirmed"].intValue
                let deaths = json[0]["deaths"].intValue
                let recovered = json[0]["recovered"].intValue
                let critical = json[0]["critical"].intValue
                
                self.totalData = TotalData(confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered)
            } else {
                self.totalData = TotalData(confirmed: 0, critical: 0, deaths: 0, recovered: 0)
            }
        }
    }
    
    func getAllCounties() {
        AF.request("https://covid-19-data.p.rapidapi.com/country/all?format=undefined", headers: headers).responseJSON { response in
            let result = response.value
            var allCount: [CountryData] = []
            
            if result != nil {
                let dataDictionary = result as! [Dictionary<String, AnyObject>]
                
                for countryData in dataDictionary {
                    let country = countryData["country"] as? String ?? "Error"
                    let longitude = countryData["longitude"] as? Double ?? 0.0
                    let latitude = countryData["latitude"] as? Double ?? 0.0
                    
                    let confirmed = countryData["confirmed"] as? Int64 ?? 0
                    let deaths = countryData["deaths"] as? Int64 ?? 0
                    let recovered = countryData["recovered"] as? Int64 ?? 0
                    let critical = countryData["critical"] as? Int64 ?? 0
                    
                    let countryObject = CountryData(country: country, confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered, longitude: longitude, latitude: latitude)
                    
                    allCount.append(countryObject)
                }
            }
            
            self.allCountry = allCount.sorted(by: { $0.confirmed > $1.confirmed })
        }
    }
}
