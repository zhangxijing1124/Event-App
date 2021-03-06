//
//  CreateView.swift
//  Event App
//
//  Created by 张熙景 on 4/21/22.
//

import SwiftUI

//{
//    "id": 1,
//    "name": "Camelback Mountain",
//    "latitude": 33.5161,
//    "longitude": -111.9619,
//    "address": {
//        "streetAddress": "Unnamed Road",
//        "city": "Phoenix",
//        "state": "Arizona",
//        "postalCode": "85018"
//    },
//    "image": "LocationImage01",
//    "events": {
//        "01": 1,
//        "02": 2,
//        "03": 3
//    }
//},

//{
//    "id": 1,
//    "name": "Happy Saturday at South Mountain",
//    "locationId": 1,
//    "totalPeople": 20,
//    "participantsPeople": 15,
//    "type": "Outdoor activity",
//    "date": "Fri Apr 20 4:40 PM",
//    "imageName": "LocationImage01"
//},

struct CreateView: View {
    @State var UserName = ""
    @State var UserEventName = ""
    @State var UserEventType = ""
    @State var UserEventPeopleNum = ""
    @State var UserEventAddress = ""
       
    var body: some View {
        NavigationView {
            List {
                VStack {
                    Text("Event Holder Name ")
                        .padding()
                    TextField("Enter your Name", text: $UserName)
                        .padding()
                    Text("Event Name ")
                        .padding()
                    TextField("Enter your event name", text: $UserEventName)
                        .padding()
                    Text("Event Type ")
                        .padding()
                    TextField("Enter your event type", text: $UserEventType)
                        .padding()
                    Text("Event people number ")
                        .padding()
                    TextField("Enter your event people number", text: $UserEventPeopleNum)
                        .padding()
                    Text("Event Location ")
                        .padding()
                    TextField("Enter your event location", text: $UserEventAddress)
                        .padding()
                }
                
                // Button
                VStack{
                    Button {
                        print("test")
//                        addUser(UserName: UserName,
//                                UserEventName: UserEventName,
//                                UserEventType: UserEventType,
//                                UserEventPeopleNum: Int(UserEventPeopleNum) ?? 0,
//                                UserEventAddress: UserEventAddress)
                    } label: {
                        Text("Create")
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                            .padding(.leading, 100)
                            .padding(.trailing, 100)
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .font(.headline)
                    .tint(.blue)
                }
                
                
            }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}



//        Button(action: {
//            addUser(UserName: UserName, UserEventName: UserEventName, UserEventType: UserEventType,UserEventPeopleNum: Int(UserEventPeopleNum) ?? 0,UserEventAddress: UserEventAddress)
//        }){
//               Text("Save to database ")
//        }
