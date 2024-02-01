//
//  ContentView.swift
//  Project16Playground
//
//  Created by Henrieke Baunack on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: String = "list"
    var body: some View {
        TabView(selection: $selectedTab)
        {
            ListView().tabItem {
                Label("List View", systemImage: "list.bullet")
            }
            NavigationStack{
                Text("Second tab")
                    .navigationTitle("Second taaaaab")
            }
            .tabItem {
                Label("number 2", systemImage: "2.circle.fill")
            }
        }
    }
}

struct ListView: View {
    let names = ["Johanna", "Florian", "James", "Amy"]
    @State private var selection: String?
    // has to be an empty set here, cannot be an optional set
    @State private var multipleSelection: Set<String> = Set()
    var body: some View {
        VStack {
//            List(names, id: \.self, selection: $selection){ name in
//                Text(name)
//            }
            
            List(names, id: \.self, selection: $multipleSelection){ name in
                Text(name)
            }
            EditButton()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
