//
//  EventDetailView.swift
//  Event App
//
//  Created by 张熙景 on 4/21/22.
//

import SwiftUI

struct ParticipantsPeople {
    let id: Int
    let username, profileImageName: String
}

struct EventDetailView: View {
    
    // All participantsPeople date
    let participantsPeoples: [ParticipantsPeople] = [
        .init(id: 1, username: "Bill Clinton", profileImageName: "UserImage01"),
        .init(id: 2, username: "Barack Obama", profileImageName: "UserImage02"),
        .init(id: 3, username: "Kyle Lopo", profileImageName: "UserImage03"),
        .init(id: 4, username: "Erast Nithya", profileImageName: "UserImage04"),
        .init(id: 5, username: "Dáša Euanthe", profileImageName: "UserImage05"),
        .init(id: 6, username: "Cassiopeia Atticus", profileImageName: "UserImage06"),
        .init(id: 7, username: "Damjana Hesiod", profileImageName: "UserImage07"),
        .init(id: 8, username: "Matěj Harun", profileImageName: "UserImage08"),
        .init(id: 9, username: "Priti Amabel", profileImageName: "UserImage09"),
        .init(id: 10, username: "Þorbjörn Bendigeidfran", profileImageName: "UserImage10")
    ]
    
    @State private var buttonState: Bool = false
    @State private var buttonText: String = "Join"
    
    let locationlist: Locationlist
    
    var body: some View {
        NavigationView {
            List {
                
                // Image and other information
                VStack {
                    Image(locationlist.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading, -20)
                        .padding(.trailing, -20)
                        .padding(.top, -10)
                    
                    VStack (alignment: .leading) {
                        Text(locationlist.name)
                            .foregroundColor(.black)
                            .font(.title)
                            .padding(.top, 0)
                        
                        Text(locationlist.type)
                            .foregroundColor(.gray)
                            .font(.headline)
                            .padding(.top, 0)
                        
                        Text(locationlist.address)
                            .foregroundColor(.gray)
                            .font(.headline)
                            .padding(.top, 0)
                        
                        Text("\(locationlist.participantsPeople) / \(locationlist.totalPeople) People")
                            .foregroundColor(.gray)
                            .font(.headline)
                            .padding(.top, 0)
                            
                        Text("Date: Apr 17 10:00 PM, Apr 27 10:00 PM ")
                            .foregroundColor(.gray)
                            .font(.headline)
                            .padding(.top, 5)
                    }
                    .padding(.bottom, 20)
                }
                
                // Button
                VStack {
                    Button {
                        if (buttonState == true) {
                            buttonState = false
                            buttonText = "Join"
                        } else {
                            buttonState = true
                            buttonText = "Quit"
                        }
                    } label: {
                        Text(buttonText)
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                            .padding(.leading, 130)
                            .padding(.trailing, 130)
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .font(.headline)
                    .tint(.blue)
                }
                
                VStack (alignment: .leading) {
                    Text("Participants People:")
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                        .font(.headline)
                    
                    // ParticipantsPeopleView rows
                    ForEach(participantsPeoples, id: \.id) { participantsPeople in
                        ParticipantsPeopleView(participantsPeople: participantsPeople)
                    }
                    
                    ForEach(participantsPeoples, id: \.id) { participantsPeople in
                        ParticipantsPeopleView(participantsPeople: participantsPeople)
                    }
                    
                }
            }
            .listStyle(GroupedListStyle())
            .ignoresSafeArea()
        }
    }
}

struct ParticipantsPeopleView: View {
    let participantsPeople: ParticipantsPeople
    var body: some View {
        
        HStack {
            Image(participantsPeople.profileImageName)
                .resizable()
                .frame(width:40, height: 40)
                .clipShape(Circle())
                .clipped()
            
            VStack (alignment: .leading) {
                Text(participantsPeople.username)
                    .font(.headline)
            }
            .padding(.leading, 8)
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(locationlist: Locationlist.init(id: 1, totalPeople: 20, participantsPeople: 10, name: "Camelback Mountain", type: "Mountain", address: "Phoenix, Arizona", imageName: "EventImage01", latitude: 33.5161, longitude: -111.9619))
    }
}
