//
//  JSONManager.swift
//  Event App
//
//  Created by 张熙景 on 4/28/22.
//

import Foundation

// LocationData
struct Location: Codable {
    let id: Int
    let name: String
    let latitude, longitude: Double
    let address: Address
    let image: String
    let events: [String: String]
    
    // Generate samples
    static let allLocation: [Location] = Bundle.main.decode(file: "LocationData.json")
    static let sampleLocation: Location = allLocation[0]
}

struct Address: Codable {
    let streetAddress, city, state, postalCode: String
}

// EventData
struct Event: Codable {
    let id: Int
    let name: String
    let location, totalPeople, participantsPeople: Int
    let type, date, imageName: String
    
    static let allEvent: [Event] = Bundle.main.decode(file: "Event.json")
    static let sampleEvent: Event = allEvent[0]
}


extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}
