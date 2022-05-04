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
            Form {
                
                // Show Outdoor activity
                Section {
                    ForEach(location, id: \.id) { location in
                        if location.id < 3  {
                            NavigationLink(destination: LocationDetailView(location: location)) {
                                VStack(alignment: .leading) {
                                    Text("\(location.name)")
                                        .bold()
                                    Text("\(location.address.city)")
                                        .foregroundColor(.gray)
                                    Text(location.address.state)
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                                .padding(6)
                            }
                        }
                    }
                } header: {
                    Text("Outdoor activity")
                        .bold()
                }
                
                // Show Sports
                Section {
                    ForEach(location, id: \.id) { location in
                        if location.id >= 3 && location.id < 5  {
                            NavigationLink(destination: LocationDetailView(location: location)) {
                                VStack(alignment: .leading) {
                                    Text("\(location.name)")
                                        .bold()
                                    Text("\(location.address.city)")
                                        .foregroundColor(.gray)
                                    Text(location.address.state)
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                                .padding(6)
                            }
                        }
                    }
                } header: {
                    Text("Sports")
                        .bold()
                }
                
                // Show Party
                Section {
                    ForEach(location, id: \.id) { location in
                        if location.id >= 5 && location.id < 7  {
                            NavigationLink(destination: LocationDetailView(location: location)) {
                                VStack(alignment: .leading) {
                                    Text("\(location.name)")
                                        .bold()
                                    Text("\(location.address.city)")
                                        .foregroundColor(.gray)
                                    Text(location.address.state)
                                        .foregroundColor(.gray)
                                }
                                .padding(6)
                            }
                        }
                    }
                } header: {
                    Text("Party")
                        .bold()
                }
                
                // Show Workshop
                Section {
                    ForEach(location, id: \.id) { location in
                        if location.id == 7  {
                            NavigationLink(destination: LocationDetailView(location: location)) {
                                VStack(alignment: .leading) {
                                    Text("\(location.name)")
                                        .bold()
                                    Text("\(location.address.city)")
                                        .foregroundColor(.gray)
                                    Text(location.address.state)
                                        .foregroundColor(.gray)
                                }
                                .padding(6)
                            }
                        }
                    }
                } header: {
                    Text("Workshop")
                        .bold()
                }
                
                
            }
            .navigationTitle("Explore location")
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
