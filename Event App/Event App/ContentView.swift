//
//  ContentView.swift
//  Event App
//
//  Created by 张熙景 on 4/18/22.
//

import SwiftUI
import Foundation
import CoreLocation
import MapKit

struct Post {
    let id: Int
    let time: Int
    let username, text, profileImageName, imageName: String
}

struct Locationlist: Hashable,Codable,Identifiable {
    
    var id: Int
    var totalPeople: Int
    var participantsPeople: Int
    
    var name: String
    var type: String
    var address: String
    var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    var latitude: Double
    var longitude: Double
    
    var region: MKCoordinateRegion{
        get{
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                                      span: MKCoordinateSpan (latitudeDelta: 0.01, longitudeDelta: 0.01))
        }
        set{
            latitude = newValue.center.latitude
            longitude = newValue.center.longitude
        }
    }
}

struct ContentView: View {
    
    // All Post date
    let posts: [Post] = [
        .init(id: 1, time: 8, username: "Bill Clinton", text: "I swear I didn't touch that girl, she came on to me!", profileImageName: "UserImage01", imageName: "UserPostImage01"),
        .init(id: 2, time: 10, username: "Barack Obama", text: "I used to be the president that people claimed wasn't born in the United States, but that isn't true", profileImageName: "UserImage02", imageName: "UserPostImage02"),
        .init(id: 3, time: 12, username: "Kyle Lopo", text: "I swear I didn't touch that girl, she came on to me!", profileImageName: "UserImage03", imageName: "UserPostImage03"),
        .init(id: 4, time: 14, username: "Erast Nithya", text: "I used to be the president that people claimed wasn't born in the United States, but that isn't true", profileImageName: "UserImage04", imageName: "UserPostImage04"),
        .init(id: 5, time: 16, username: "Erast Nithya", text: "I used to be the president that people claimed wasn't born in the United States, but that isn't true", profileImageName: "UserImage05", imageName: "UserPostImage05")
    ]
    
    // All Event date
    let locationlists: [Locationlist] = [
        .init(id: 1, totalPeople: 20, participantsPeople: 10, name: "Camelback Mountain", type: "Mountain", address: "Phoenix, Arizona", imageName: "EventImage01", latitude: 33.5161, longitude: -111.9619),
        .init(id: 2, totalPeople: 20, participantsPeople: 15, name: "South Mountain", type: "Mountain", address: "Phoenix, Arizona", imageName: "EventImage02", latitude: 33.3402, longitude: -112.0609),
        .init(id: 3, totalPeople: 20, participantsPeople: 15, name: "South Mountain", type: "Mountain", address: "Phoenix, Arizona", imageName: "EventImage03", latitude: 33.3402, longitude: -112.0609),
        .init(id: 4, totalPeople: 20, participantsPeople: 15, name: "South Mountain", type: "Mountain", address: "Phoenix, Arizona", imageName: "EventImage04", latitude: 33.3402, longitude: -112.0609),
        .init(id: 5, totalPeople: 20, participantsPeople: 15, name: "South Mountain", type: "Mountain", address: "Phoenix, Arizona", imageName: "EventImage05", latitude: 33.3402, longitude: -112.0609),
        .init(id: 6, totalPeople: 20, participantsPeople: 15, name: "South Mountain", type: "Mountain", address: "Phoenix, Arizona", imageName: "EventImage06", latitude: 33.3402, longitude: -112.0609),
        .init(id: 7, totalPeople: 20, participantsPeople: 15, name: "South Mountain", type: "Mountain", address: "Phoenix, Arizona", imageName: "EventImage07", latitude: 33.3402, longitude: -112.0609),
        .init(id: 8, totalPeople: 20, participantsPeople: 15, name: "South Mountain", type: "Mountain", address: "Phoenix, Arizona", imageName: "EventImage08", latitude: 33.3402, longitude: -112.0609),
        .init(id: 9, totalPeople: 20, participantsPeople: 15, name: "South Mountain", type: "Mountain", address: "Phoenix, Arizona", imageName: "EventImage09", latitude: 33.3402, longitude: -112.0609),
        .init(id: 10, totalPeople: 20, participantsPeople: 15, name: "South Mountain", type: "Mountain", address: "Phoenix, Arizona", imageName: "EventImage10", latitude: 33.3402, longitude: -112.0609),
    ]
    
    var body: some View {
        NavigationView {
            List {
                
                VStack (alignment: .leading) {
                    
                    // Locationlist rows 01
                    Text("Event about Outdoor Exercise")
                        .font(Font.system(size:22, design: .default))
                        .font(Font.title.weight(.bold))
                        .padding( .top, 20)
                        .padding( .bottom, 1)
                    Text("More things to do in Tempe")
                        .font(Font.system(size:16, design: .default))
                        .padding( .bottom, 5)
                    
                    ScrollView (.horizontal, showsIndicators: false, content: {
                        HStack {
                            ForEach(locationlists, id: \.id) { locationlist in
                                NavigationLink(destination: EventDetailView(locationlist: locationlist)) {
                                    EventView(locationlist: locationlist)
                                }
                            }
                        }
                    })
                    .padding(.trailing, -20)
                    
                    // Locationlist rows 02
                    Text("Event about Outdoor Exercise")
                        .font(Font.system(size:22, design: .default))
                        .font(Font.title.weight(.bold))
                        .padding( .top, 20)
                        .padding( .bottom, 1)
                    Text("More things to do in Tempe")
                        .font(Font.system(size:16, design: .default))
                        .padding( .bottom, 5)
                    
                    ScrollView (.horizontal, showsIndicators: false, content: {
                        HStack {
                            ForEach(locationlists, id: \.id) { locationlist in
                                NavigationLink(destination: EventDetailView(locationlist: locationlist)) {
                                    EventView(locationlist: locationlist)
                                }
                            }
                        }
                    })
                    .padding(.trailing, -20)
                    
                }
                
                // Post rows
                ForEach(posts, id: \.id) { post in
                    PostView(post: post)
                }
            }
            .navigationTitle("Event App")
            .listStyle(GroupedListStyle())
//            .ignoresSafeArea()
        }
    }
}

// EventView
struct EventView: View {
    let locationlist: Locationlist
    var body: some View {
        VStack (alignment: .leading) {
            Image(locationlist.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(locationlist.name)
                .foregroundColor(.black)
                .font(.headline)
            
            Text(locationlist.type)
                .foregroundColor(.gray)
                .font(.subheadline)
            
            Text(locationlist.address)
                .foregroundColor(.gray)
                .font(.subheadline)
            
            Text("\(locationlist.participantsPeople) / \(locationlist.totalPeople) People")
                .foregroundColor(.gray)
                .font(.subheadline)
        }
        .frame(width: 226, height: 300)
    }
}

// PostView
struct PostView: View {
    let post: Post
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            HStack {
                Image(post.profileImageName)
                    .resizable()
                    .frame(width:40, height: 40)
                    .clipShape(Circle())
                    .clipped()
                VStack (alignment: .leading) {
                    Text(post.username)
                        .font(.headline)
                    Text("\(post.time) hours ago")
                        .font(. subheadline)
                }
                .padding(.leading, 8)
            }
            .padding(.leading, 16)
            .padding(.top, 16)
            
            Text(post.text)
                .lineLimit(nil)
                .padding(.leading, 16)
                .padding(.trailing, 0)
            Image(post.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding(.leading, -20)
        .padding(.trailing, -20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
