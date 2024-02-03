//
//  ImageInterpolationView.swift
//  Project16Playground
//
//  Created by Henrieke Baunack on 2/2/24.
//

import SwiftUI

struct ImageInterpolationView: View {
    var body: some View {
        Image(.example)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
        Image(.example)
            .interpolation(.high)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ImageInterpolationView()
}
