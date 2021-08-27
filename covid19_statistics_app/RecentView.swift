//
//  RecentView.swift
//  covid19_statistics_app
//
//  Created by Junior Ferreira on 27/08/21.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var covidFetch = CovidRequest()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
