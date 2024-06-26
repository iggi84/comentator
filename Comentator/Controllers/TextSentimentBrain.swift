//
//  TextSentimentBrain.swift
//  Comentator
//
//  Created by Igor  Vojinovic on 30.4.24..
//

import Foundation
import CoreML


class TextSentimentBrain {
    
    func validateSentiment(text: String) -> String {
        do {
            let model = try SentimentBrain(configuration: MLModelConfiguration())
            let input = SentimentBrainInput(text: text)
            guard let prediction = try? model.prediction(input: input) else {
                return "Um, this is wrong. So, sorry!"
            }
            
            switch prediction.label {
            case "positive":
               return "Oh, thats a nice Positive comment! 🥳"
            case "negative":
                return "Why would you say such a Negative thing? 😞"
            case "neutral":
                return "It's so neutral 🤔"
            default:
                return "😱"
            }
        } catch {
            return "Um, this is wrong. So, sorry!"
        }
    }
}
