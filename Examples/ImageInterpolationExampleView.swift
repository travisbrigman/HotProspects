//
//  ImageInterpolationExampleView.swift
//  HotProspects
//
//  Created by Travis Brigman on 3/9/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct ImageInterpolationExampleView: View {
    var body: some View {
        Image("example")
            .interpolation(.none) //this keeps ios from smoothing the image out
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ImageInterpolationExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ImageInterpolationExampleView()
    }
}
