//
//  ResultTypeView.swift
//  Project16Playground
//
//  Created by Henrieke Baunack on 2/1/24.
//

import SwiftUI

struct ResultTypeView: View {
    @State private var output = ""
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    func fetchReadings() async {
        // one possible way of fetching the data and outputting it
//        do {
//            let url = URL(string: "https://hws.dev/readings.json")!
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let readings = try JSONDecoder().decode([Double].self, from: data)
//            output = "Found \(readings.count) readings"
//        } catch {
//            print("Download error")
//        }
        
        
        // another way: using the Result type
        // because we assign the Task (that does the work) to a variable, we store it, can hand it aroung and use it elsewhere
        // Task closure returns a value here that gets stored in the fetchTask variable OR if the fetch process fails, the fetchTask variable stores an error => thus is of Result type
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        let resultTest = await fetchTask.result // this is of type Result<String, Error> – if it succeeded it will contain a string, but it might also have failed and will contain an error.
        
        // now you can either read the success value directly but need to handle errors here
        do {
            output = try resultTest.get()
        } catch {
            output = "There was an error: \(error.localizedDescription)"
        }
        
        
        // alternatively you can use a specific switch case statement
//        switch resultTest {
//        case .success(let success):
//            output = success
//        case .failure(let failure):
//            output = "There was an error: \(failure.localizedDescription)"
//        }
        
    }
}

#Preview {
    ResultTypeView()
}
