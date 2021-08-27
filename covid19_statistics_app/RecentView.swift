//
//  RecentView.swift
//  covid19_statistics_app
//
//  Created by Junior Ferreira on 27/08/21.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var covidFetch = CovidRequest()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ListHeaderView()
                List {
                    ForEach (covidFetch.allCountry.filter {
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) { countryData in
                        ListRowView(countryData: countryData)
                    }
                }
            }
        }
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
