//
//  ContentView.swift
//  QuizApp
//
//  Created by apprenant71 on 24/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var quizManagerVM: QuizManagerVM
    
    var body: some View {
        
            if (quizManagerVM.model.isCompleted) {
                 QuizCompletedView(quizManagerVM: quizManagerVM)
                
                
            } else {
                VStack {
                    TitleView()
                    
                    Text("Mes points : \(quizManagerVM.myPoints)")
                        .foregroundColor(Color("Sapphire"))
                        .font(.system(size: 24, weight: .bold))
                    
                    
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 15)
                            .foregroundColor(.gray)
                            .opacity(0.4)
                        
                        Circle()
                            .trim(from: 0.0, to:
                                    min(CGFloat(quizManagerVM.progress), 1.0))
                            .stroke(LinearGradient(colors: [.red, .green], startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 18, lineCap: .round, lineJoin: .round))
                            .rotationEffect(Angle(degrees: 270))
                            .animation(Animation.linear(duration: Double(quizManagerVM.maxProgress)), value: quizManagerVM.progress)
                        
                        Text("\(quizManagerVM.timeRemaining)")
                            .font(.system(size: 40, weight: .bold))
                            
                    }
                    .frame(width: 96, height: 96)
                    .padding(.vertical, 24)
                    
                    
                    QuestionView(question: quizManagerVM.model.quizModel.question, questionNumber: quizManagerVM.model.currentQuestionIndex)
                        .padding(16)
                    
                    
                    OptionsView(quizManagerVM: quizManagerVM)
                    
                }
                .background(Color.gray.opacity(0.2))
                .padding(24)
                .ignoresSafeArea()
            }
            
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(quizManagerVM: QuizManagerVM())
    }
}




