//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Samet Baltacıoğlu on 31.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    @State private var rollTimer: Timer?
    @State private var stopTimer: Timer?
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    diceView(n: leftDiceNumber)
                    diceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    rollTimer?.invalidate()
                    stopTimer?.invalidate()
                    rollTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }
                    stopTimer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { _ in
                                self.rollTimer?.invalidate()
                            }
                }) {
                    Text("Zar At")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }
            .padding(.bottom)
        }

    }
}

struct diceView: View {
    let n:Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1,contentMode: .fit)
            .padding()
    }
}


#Preview {
    ContentView()
}
