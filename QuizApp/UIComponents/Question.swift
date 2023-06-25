//
//  Question.swift
//  QuizApp
//
//  Created by apprenant71 on 24/06/2023.
//

import Foundation
import SwiftUI

struct QuestionView: View {
    
    var question : String
    var questionNumber : Int
    
    var body: some View {
        
        VStack(spacing: 8) {
            Text("Question: \(questionNumber + 1)")
                .font(.system(size: 24))
            Text(question)
                .font(.system(size: 20, weight: .bold))
                .lineLimit(3)
                .frame(width: UIScreen.main.bounds.size.width - 24, height: 70, alignment: .center)
                .multilineTextAlignment(.center)
        }

    }
}
