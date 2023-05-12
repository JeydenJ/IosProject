//
//  DataStore.swift
//  IOSPROJECTAPP
//
//  Created by Jeyden Johnson on 12/5/2023.
//

import Foundation

struct User : Codable {
    let email: String
    let password: String
}
class DataStore{
    var email: String = ""
    var password: String = ""
    var users: [User] = []
    
    
    private let fileName = "users.txt"
    static let shared = DataStore()
    
    // Write to JSON file and encode users with JSONENCODER
    func saveUsers() {
            do {
                let fileURL = try FileManager.default
                    .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    .appendingPathComponent(fileName)
                let encoder = JSONEncoder()
                let data = try encoder.encode(users)
                try data.write(to: fileURL, options: .atomic)
            } catch {
                print("Error saving users: \(error.localizedDescription)")
            }
        }
    // load users by decoding JSON file
    func loadUsers() {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent(fileName)
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            users = try decoder.decode([User].self, from: data)
        } catch {
            print("Error loading users: \(error.localizedDescription)")
        }
    }
    private init() {}
}
