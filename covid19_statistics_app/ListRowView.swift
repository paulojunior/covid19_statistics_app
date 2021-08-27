//
//  ListRowView.swift
//  covid19_statistics_app
//
//  Created by Junior Ferreira on 27/08/21.
//

import SwiftUI

struct ListRowView: View {
    
    var countryData: CountryData
    
    var body: some View {
        HStack {
            Text(countryData.country)
                .fontWeight(.medium)
                .font(.subheadline)
                .lineLimit(2)
                .frame(width: 110, alignment: .leading)
               
            
            Spacer()
            
            Text(countryData.confirmed.formatNumber())
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryData.deaths.formatNumber())
                .frame(width: 50, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.subheadline)
                .foregroundColor(.red)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryData.recovered.formatNumber())
                .frame(width: 50, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.subheadline)
                .foregroundColor(.green)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        let mock = CountryData(country: "XPTO", confirmed: 0, critical: 0, deaths: 0, recovered: 0, longitude: 0, latitude: 0)
        ListRowView(countryData: mock)
    }
}
