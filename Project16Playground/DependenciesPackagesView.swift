//
//  DependenciesPackagesView.swift
//  Project16Playground
//
//  Created by Henrieke Baunack on 2/3/24.
//

import SamplePackage
import SwiftUI

struct DependenciesPackagesView: View {
    let possibleNumbers = 1...60
    var results: String {
        // .random(int) is a new method extension from the samplepackage we imported
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init) // converting to string
        return strings.formatted() // this will join all the strings in the array together
    }
    var body: some View {
        Text(results)
    }
}

#Preview {
    DependenciesPackagesView()
}
