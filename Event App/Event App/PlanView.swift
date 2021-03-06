//
//  PlanView.swift
//  Event App
//
//  Created by 张熙景 on 4/21/22.
//


// EventData

import SwiftUI

struct PlanView: View {
    var body: some View {
        NavigationView {
            VStack{
                List(LocationData) { name in
                    NavigationLink {
                        EventDetailView(locationlist: name)
                    } label: {
                        EventRow(Location: name)
                    }
                }
                .navigationTitle("Plan")
            }
        }
    }
}

// Event row
struct EventRow: View {
    var Location: Locationlist
    var body: some View {
        HStack {
            Location.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(Location.name)
            Spacer()
        }
    }
}
        
struct PlanView_Previews: PreviewProvider {
    static var previews: some View {
        PlanView()
    }
}
