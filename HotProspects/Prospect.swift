//
//  Prospect.swift
//  HotProspects
//
//  Created by Travis Brigman on 3/9/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

class Prospect: Codable, Identifiable {
    var id = UUID()
    var name = "Anonymous"
    var email = ""
    fileprivate (set) var isContacted = false
    
}

class Prospects: ObservableObject {
   var files = FileManager()
    
    @Published private(set) var people: [Prospect]
    static let saveKey = "SavedData"
    
    init() {
        let fileName = self.files.getDocumentsDirectory().appendingPathComponent(Self.saveKey)
        do {
            let data = try Data(contentsOf: fileName)
            let people = try JSONDecoder().decode([Prospect].self, from: data)
            self.people = people
        } catch {
            print("Unable to load saved data")
            self.people = []
        }
    }
    
    
   /*
     SAVE DATA WITH USER DEFAULTS
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
 */
    private func save() {
        //find the documents directory associated with this app...
        let fileName = self.files.getDocumentsDirectory().appendingPathComponent(Self.saveKey)
        
        do {
            //encode the array of people to JSON
            let data = try JSONEncoder().encode(people)
            //write what we just encoded to directory we found
            try data.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
            //print it to the console
            let input = try String(contentsOf: fileName)
            print(input)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func reverse(_ prospect: Prospect) {
        objectWillChange.send()
        people.reverse()
        save()
    }
    
    func nameSort(_ prospect: Prospect) {
        objectWillChange.send()
        people.sort { $0.name < $1.name }
        save()
    }
}
