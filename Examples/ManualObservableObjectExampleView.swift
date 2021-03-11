//
//  ManualObservableObjectExampleView.swift
//  HotProspects
//
//  Created by Travis Brigman on 3/9/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }

    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ManualObservableObjectExampleView: View {
     @ObservedObject var updater = DelayedUpdater()

       var body: some View {
           Text("Value is: \(updater.value)")
       }
}

struct ManualObservableObjectExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ManualObservableObjectExampleView()
    }
}
