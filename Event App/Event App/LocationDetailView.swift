//
//  LocationDetailView.swift
//  Event App
//
//  Created by 张熙景 on 4/29/22.
//

import SwiftUI

struct LocationDetailView: View {
    
    var location: Location
    
    var body: some View {
            NavigationView {
            VStack(spacing: 10) {
                Text("\(location.name)")
                    .bold()
                Text("\(location.latitude)")
                Text("\(location.address.streetAddress)")
                Text("\(location.address.city)")
                Image(location.image)
            }
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: Location.sampleLocation)
    }
}
