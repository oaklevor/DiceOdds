//
//  OddsMode.swift
//  DiceOdds
//
//  Created by oaklevorn on 8/4/25.
//

import SwiftUI

struct OddsMode: View {
    @State private var numDice: String = ""
    @State private var numRolls: String = ""
    @State private var target: String = "Target Roll"
    
    func Odds () -> String {
        // error handling
        if (numDice == "Number of Dice Being Rolled") {
            return "Input Data to try your odds"
        }
        let numberOfDice = Int(numDice)
        let numberOfRolls = Int(numRolls)
        if (numberOfDice == nil || numberOfRolls == nil) {
            return "We couldn't find your odds."
        }
        var targetRoll: Int

        guard let firstChar = target.first,
              let roll = Int(String(firstChar)) else {
            return "We couldn't find your odds."
        }
        
        targetRoll = roll
        
        // actually calculate
        var stringResponse = ""
        
        let totalRolls = (numberOfDice ?? 1) * (numberOfRolls ?? 1)
        let targetProbability = 1.0 / 6.0  // assuming you're targeting a specific face like "one"

        for i in 1...totalRolls {
            let prob = binomialProbability(n: totalRolls, k: i, p: targetProbability)
            
            stringResponse += "You have "
            var percentString = String(format: "%.2f", prob * 100)
            if (percentString == "0.00") {
                percentString = String(format: "%.4f", prob * 100)
            }
            stringResponse += percentString
            stringResponse += "% chance to roll \(i) "
            stringResponse += convertNumberToWords(number: targetRoll) ?? ""
            
            if i > 1 {
                stringResponse += targetRoll == 6 ? "es" : "s"
            }
            stringResponse += "\n"
        }
        return stringResponse
    }
    
    func binomialProbability(n: Int, k: Int, p: Double) -> Double {
        let combination = Double(factorial(n)) / (Double(factorial(k)) * Double(factorial(n - k)))
        return combination * pow(p, Double(k)) * pow(1 - p, Double(n - k))
    }

    func factorial(_ n: Int) -> Int {
        return (1...max(n,1)).reduce(1, *)
    }
    
    func convertNumberToWords(number: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut // This style converts numbers to words
        
        // Attempt to format the number and return the result
        return formatter.string(from: NSNumber(value: number))
    }

    var body: some View {
        VStack {
            Text("Odds App").font(.largeTitle)
            Menu {
                  Button("1", action: { numDice = "1" })
                  Button("2", action: { numDice = "2" })
                  Button("3", action: { numDice = "3" })
                  Button("4", action: { numDice = "4" })
                  Button("5", action: { numDice = "5" })
                } label: {
                  Label("Number of Dice Being Rolled: " + numDice, systemImage: "chevron.down")
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
            Menu {
                Button("1's", action: { target = "1's" })
                Button("2's", action: { target = "2's" })
                Button("3's", action: { target = "3's" })
                Button("4's", action: { target = "4's" })
                Button("5's", action: { target = "5's" })
                Button("6's", action: { target = "6's" })
                } label: {
                  Label(target, systemImage: "chevron.down")
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
                }
            Text(Odds())
        }
        .padding()
    }
}

#Preview {
    OddsMode()
}
