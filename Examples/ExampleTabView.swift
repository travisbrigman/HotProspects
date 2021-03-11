//
//  ExampleTabView.swift
//  HotProspects
//
//  Created by Travis Brigman on 3/9/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

enum Tab {
    case one,two
}

struct ExampleTabView: View {
    @State private var selectedTab = Tab.one //set a default state

    var body: some View {
        TabView(selection: $selectedTab) { // tell the view to watch that state
            Text("Tab 1")
                .onTapGesture {
                    self.selectedTab = Tab.one //create a way to change the state
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("One")
                }
            .tag(Tab.one) // give each tab a tag

            Text("Tab 2")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Two")
                }
            .tag(Tab.two) // second tab's tag
        }
    }
}

struct ExampleTabView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleTabView()
    }
}
