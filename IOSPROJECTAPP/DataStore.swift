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
    let firstName: String
    let lastName: String
    let suburb: String
}
class DataStore{
    var users: [User] = []
    var loggedInUserEmail: String?
    
    
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
        print("loading users...")
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

    func getFirstNameForLoggedInUser() -> String? {
            guard let loggedInUserEmail = loggedInUserEmail else {
                return nil
            }
        print("loggedInUserEmail:", loggedInUserEmail)
        
            if let loggedInUser = users.first(where: { $0.email == loggedInUserEmail }) {
                print("loggedInUser:", loggedInUser)
                return loggedInUser.firstName
            } else {
                return nil
            }
        }
    private init() {}
}
