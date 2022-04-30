//
//  LocationView.swift
//  Event App
//
//  Created by 张熙景 on 4/29/22.
//

import SwiftUI

struct LocationView: View {
    
    private var location: [Location] = Location.allLocation
    
    var body: some View {
        NavigationView {
            List {
                ForEach(location, id: \.id) { location in
                    NavigationLink(destination: LocationDetailView(location: location)) {
                        VStack(alignment: .leading) {
                            Text("\(location.name)")
                                .bold()
                            Text("\(location.address.city)")
                                .foregroundColor(.gray)
                        }
                        .padding(6)
                    }
                }
            }
            .navigationTitle("Location List")
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
