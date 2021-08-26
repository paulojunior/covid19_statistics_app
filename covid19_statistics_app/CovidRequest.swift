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
    
    init() {
        getCurrentTotal()
    }
    
    func getCurrentTotal() {
        
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
            "x-rapidapi-key": "d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59"
        ]
        
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=undefined", headers: headers).responseJSON { response in
            debugPrint(response)
        }
    }
}
