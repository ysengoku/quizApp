//
//  OptionsView.swift
//  QuizApp
//
//  Created by apprenant71 on 25/06/2023.
//

import Foundation
import SwiftUI

struct OptionsView: View {
    
    var quizManagerVM: QuizManagerVM
    
//    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170), spacing: 2), count: 2)
    var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        
        LazyVGrid(columns: gridLayout, spacing: 16) {
            ForEach(quizManagerVM.model.quizModel.options) { quizOption in
                OptionCardView(quizOption: quizOption)
                    .onTapGesture {
                        quizManagerVM.verifyMyAnswer(selectedOption: quizOption)
                    }
            }
        }
    }
       
   
    
    struct OptionCardView : View {
        var quizOption: QuizOption
        var body: some View {
            VStack {
                if (quizOption.isCorrect) && (quizOption.isSelected) {
                    // The right answer is selected
                    OptionStatusImageView(imageName: "checkmark")
                } else if (!(quizOption.isCorrect) && (quizOption.isSelected)) {
                    // A wrong answer is selected
                    OptionStatusImageView(imageName: "xmark")
                } else {
                    OptionView(quizOption: quizOption)
                }
            }
            .frame(width: 160, height: 160)
            .foregroundColor(setTextColor())
            .background(quizOption.color.opacity(0.8))
            .cornerRadius(32)
        }
        
        func setTextColor() -> Color {
            if (quizOption.isCorrect) && (quizOption.isSelected) {
                        return Color.green
                    } else if (!(quizOption.isCorrect) && (quizOption.isSelected)) {
                        return Color.red
                    } else {
                        return Color.black
                    }
        }
    }
    
    
    struct OptionView: View {
        var quizOption: QuizOption
        var body: some View {
            VStack {
                Text(quizOption.optionId + ".")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black.opacity(0.5))
//                    .frame(width: 32, height: 32)
//                    .background(.white)
//                    .cornerRadius(25)
                
                Text(quizOption.option)
                    .frame(width: 150, height: 38)
                    .font(.system(size: 20, weight: .bold))
            }
        }
    }
    
    struct OptionStatusImageView: View {
        var imageName: String
        var body: some View {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(40)
        }
    }
}
