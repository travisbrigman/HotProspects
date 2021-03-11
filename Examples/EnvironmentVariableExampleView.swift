//
//  EnvironmentVariableExampleView.swift
//  HotProspects
//
//  Created by Travis Brigman on 3/9/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User

    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User

    var body: some View {
        Text(user.name)
    }
}

struct EnvironmentVariableExampleView: View {
    let user = User()
    
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

struct EnvironmentVariableExampleView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentVariableExampleView()
    }
}
