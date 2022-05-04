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
            VStack {
                Image(location.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, -20)
                    .padding(.trailing, -20)
                    .padding(.top, -10)
                
                VStack (alignment: .leading) {
                    Text(location.name)
                        .foregroundColor(.black)
                        .font(.title)
                        .padding(.top, 0)
                    
                    Text(location.address.streetAddress)
                        .foregroundColor(.gray)
                        .font(.headline)
                        .padding(.top, 0)
                    
                    Text(location.address.city)
                        .foregroundColor(.gray)
                        .font(.headline)
                        .padding(.top, 0)
                    
                    Text(location.address.state)
                        .foregroundColor(.gray)
                        .font(.headline)
                        .padding(.top, 0)
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: Location.sampleLocation)
    }
}
