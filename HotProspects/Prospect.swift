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
    @Published private(set) var people: [Prospect]
    static let saveKey = "SavedData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }
        self.people = []
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
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
}
