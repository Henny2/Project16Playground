//
//  ListRowButtonsView.swift
//  Project16Playground
//
//  Created by Henrieke Baunack on 2/3/24.
//

import SwiftUI

struct ListRowButtonsView: View {
    var body: some View {
        List{
            Text("Taylor Swift")
                .swipeActions {
                    Button("Delete", systemImage: "minus.circle", role: .destructive){
                        print("Delete")
                    }
                }
                .swipeActions(edge: .leading){
                    Button("Pin", systemImage: "pin"){
                        print("Pinning")
                    }
                    .tint(.orange)
                }
        }
    }
}

#Preview {
    ListRowButtonsView()
}
