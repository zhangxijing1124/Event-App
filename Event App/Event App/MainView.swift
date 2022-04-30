//
//  MainView.swift
//  Event App
//
//  Created by 张熙景 on 4/21/22.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Explore", systemImage: "square.text.square")
                }
            
            LocationView()
                .tabItem {
                    Label("Nearby", systemImage: "location")
                }
            
            CreateView()
                .tabItem {
                    Label("Create", systemImage: "square.and.pencil")
                }
            
            PlanView()
                .tabItem {
                    Label("Plan", systemImage: "heart")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
