//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Omer Cagri Sayir on 2.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland",
                     "Italy", "Nigeria", "Poland", "Ukrain", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack (spacing: 30){
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                }
                ForEach(0..<3) {number in
                    Button {
                      flagTapped(number)
                    } label: {
                        Image(countries[number]).renderingMode(.original)
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
        
    }
}

#Preview {
    ContentView()
}
