//
//  ContextMenusView.swift
//  Project16Playground
//
//  Created by Henrieke Baunack on 2/2/24.
//

import SwiftUI

struct ContextMenusView: View {
    @State private var chosenColor: Color = .blue
    var body: some View {
        Text("Push here for a menu!")
            .foregroundStyle(chosenColor)
        // apple does not allow to style context menus so they show in grey whatever you do (except changing the intent of a button)
            .contextMenu(ContextMenu(menuItems: {
                Button("blue"){
                    chosenColor = .blue
                }
                Button("green"){
                    chosenColor = .green
                }
                Button("red", role: .destructive){
                    chosenColor = .red
                }
        }))
    }
}

#Preview {
    ContextMenusView()
}
