//
//  ContentView.swift
//  Comentator
//
//  Created by Igor  Vojinovic on 30.4.24..
//

import SwiftUI
import CoreML

struct Main: View {
    
    // MARK: - Properties
    
    @State private var input = ""
    @State private var predictionLabel = "-"
    private let brain = TextSentimentBrain()
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Spacer()
                Text("Welcome to comment analyser")
                    .font(.title)
                    .foregroundStyle(.blue)
                    .padding(20)
                    .multilineTextAlignment(.center)
                Text(predictionLabel)
                    .font(.title)
                    .foregroundStyle(.blue)
                    .padding(20)
                    .multilineTextAlignment(.center)
                VStack {
                    TextField("Please enter comment", text: $input)
                        .frame(height: 55)
                        .foregroundStyle(.blue)
                        .padding([.leading, .trailing], 20)
                        .background(.white)
                        .cornerRadius(10.0)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Button("Validate") {
                        predictionLabel = brain.validateSentiment(text: input)
                    }
                    .frame(width: 200, height: 55)
                    .font(.title)
                    .border(.blue, width: 5)
                    .cornerRadius(10.0)
                    .padding()
                }.padding(20)
                
               Spacer()
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    Main()
}
