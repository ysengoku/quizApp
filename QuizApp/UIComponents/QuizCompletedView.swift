//
//  QuizCompletedView.swift
//  QuizApp
//
//  Created by apprenant71 on 25/06/2023.
//

import Foundation
import SwiftUI

struct QuizCompletedView: View {
    
    var quizManagerVM: QuizManagerVM
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            Spacer()
            
            if (quizManagerVM.model.winningStatus) { // If the user complete all the question in time
                Text("BRAVO !")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(Color("Sapphire"))
            } else { // If time over
                
                ZStack {
                    Image(systemName: "burst.fill")
                        .font(.system(size: 160))
                        .foregroundColor(.yellow.opacity(0.7))
                
                    Text("GAME OVER")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.red)
                }
            }
                
            
            Text(quizManagerVM.model.winningStatus ? "Merci d'avoir particié au quiz." : "Bonne chance pour la prochaine fois.")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.black.opacity(0.8))
                .lineLimit(3)
                .frame(width: UIScreen.main.bounds.size.width - 24, height: 80, alignment: .center)
                .multilineTextAlignment(.center)
            
            
            Button {
                quizManagerVM.restartQuiz()
            } label: {
                    Text("Recommencer le quiz")
                    .font(.system(size: 18, weight: .medium))
                    .padding(8)
            }
            .frame(width: 280, height: 44, alignment: .center)
            .background(Color("Sapphire").opacity(0.6))
            .cornerRadius(8)
            .foregroundColor(.white)
            .padding(.top, 64)
           
            Spacer()
            
        }
        
    }
    
}
