//
//  ContentView.swift
//  Event App
//
//  Created by 张熙景 on 4/18/22.
//

import SwiftUI

struct Post {
    let id: Int
    let username, text, imageName: String
}

struct ContentView: View {
    
    let posts: [Post] = [
        .init(id: 0, username: "username0", text: "text0", imageName: "gaugan_output_01"),
        .init(id: 1, username: "username1", text: "text1", imageName: "gaugan_output_02")
    ]
    
    var body: some View {
        NavigationView {
            List {
                
                ScrollView {
                    VStack {
                        Rectangle()
                            .frame(height: 300)
                        Rectangle()
                            .frame(height: 300)
                        Rectangle()
                            .frame(height: 300)
                    }
                }
                
                
                VStack (alignment: .leading) {
                    Text("Trending")
                    ScrollView {
                            VStack (alignment: .leading) {
                                HStack {
                                    NavigationLink(destination: EventDetailView()) {
                                        EventView()
                                    }
                                    NavigationLink(destination: EventDetailView()) {
                                        EventView()
                                    }
                                    NavigationLink(destination: EventDetailView()) {
                                        EventView()
                                    }
                                    NavigationLink(destination: EventDetailView()) {
                                        EventView()
                                    }
                                    NavigationLink(destination: EventDetailView()) {
                                        EventView()
                                    }
                                }
                            }
                        }.frame(height: 300)
                }
                
                VStack (alignment: .leading) {
                    Text("Trending")
                    ScrollView {
                            VStack (alignment: .leading) {
                                HStack {
                                    NavigationLink(destination: EventDetailView()) {
                                        EventView()
                                    }
                                    NavigationLink(destination: EventDetailView()) {
                                        EventView()
                                    }
                                    NavigationLink(destination: EventDetailView()) {
                                        EventView()
                                    }
                                    NavigationLink(destination: EventDetailView()) {
                                        EventView()
                                    }
                                    NavigationLink(destination: EventDetailView()) {
                                        EventView()
                                    }
                                }
                            }
                        }.frame(height: 300)
                }
                
                
                // Post rows
                ForEach(posts, id: \.id) { post in
                    PostView(post: post)
                }
            }
            .navigationTitle("Groups")
            .listStyle(GroupedListStyle())
        }
    }
}

// EventView
struct EventView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Image("gaugan_output_01")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("Co-ED Hikes of Colorado")
                .lineLimit(nil)
                .padding(.leading, 0)
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
                Image("gaugan_output_02")
                    .resizable()
                    .frame(width:40, height: 40)
                    .clipShape(Circle())
                    .clipped()
                VStack (alignment: .leading) {
                    Text("Username")
                        .font(.headline)
                    Text("Posted 8 hours ago")
                        .font(. subheadline)
                }
                .padding(.leading, 8)
            
            }
            .padding(.leading, 16)
            .padding(.top, 16)
            
            Text("Post body text htat will. Post body text htat will. Post body text htat will. Post body text htat will. Post body text htat will ")
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
        ContentView()
    }
}
