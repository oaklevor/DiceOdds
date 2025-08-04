//
//  PredictionMode.swift
//  DiceOdds
//
//  Created by oaklevorn on 8/4/25.
//

import SwiftUI

struct PredictionMode: View {
    @State private var dice1: String = ""
    @State private var dice2: String = ""
    @State private var dice3: String = ""
    @State private var dice4: String = ""
    @State private var dice5: String = ""
    @State private var numRolls: String = ""
    
    
    var body: some View {
        VStack {
            Menu {
                  Button("1", action: { dice1 = "1" })
                  Button("2", action: { dice1 = "2" })
                  Button("3", action: { dice1 = "3" })
                  Button("4", action: { dice1 = "4" })
                  Button("5", action: { dice1 = "5" })
                  Button("6", action: { dice1 = "6" })
                } label: {
                  Label("Dice 1: " + dice1, systemImage: "chevron.down")
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                }
            Menu {
                Button("1", action: { dice2 = "1" })
                Button("2", action: { dice2 = "2" })
                Button("3", action: { dice2 = "3" })
                Button("4", action: { dice2 = "4" })
                Button("5", action: { dice2 = "5" })
                Button("6", action: { dice2 = "6" })
                } label: {
                  Label("Dice 2: " + dice2, systemImage: "chevron.down")
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                }
            Menu {
                Button("1", action: { dice3 = "1" })
                Button("2", action: { dice3 = "2" })
                Button("3", action: { dice3 = "3" })
                Button("4", action: { dice3 = "4" })
                Button("5", action: { dice3 = "5" })
                Button("6", action: { dice3 = "6" })
                } label: {
                  Label("Dice 3: " + dice3, systemImage: "chevron.down")
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                }
            Menu {
                Button("1", action: { dice4 = "1" })
                Button("2", action: { dice4 = "2" })
                Button("3", action: { dice4 = "3" })
                Button("4", action: { dice4 = "4" })
                Button("5", action: { dice4 = "5" })
                Button("6", action: { dice4 = "6" })
                } label: {
                  Label("Dice 4: " + dice4, systemImage: "chevron.down")
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                }
            Menu {
                Button("1", action: { dice5 = "1" })
                Button("2", action: { dice5 = "2" })
                Button("3", action: { dice5 = "3" })
                Button("4", action: { dice5 = "4" })
                Button("5", action: { dice5 = "5" })
                Button("6", action: { dice5 = "6" })
                } label: {
                  Label("Dice 5: " + dice5, systemImage: "chevron.down")
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                }
             Menu {
                  Button("1", action: { numRolls = "1" })
                  Button("2", action: { numRolls = "2" })
                  Button("3", action: { numRolls = "3" })
                } label: {
                  Label("Number of Rolls Left: " + numRolls, systemImage: "chevron.down")
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                }
            Text("Hello, World!")
        }
        .padding()
    }
}

#Preview {
    PredictionMode()
}
