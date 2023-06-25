//
//  QuizManagerVM.swift
//  QuizApp
//
//  Created by apprenant71 on 25/06/2023.
//

import Foundation
import SwiftUI

class QuizManagerVM : ObservableObject {
    
    static var currentIndex = 0
    
    static func createQuizModel(i: Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model = QuizManagerVM.createQuizModel(i: QuizManagerVM.currentIndex)
    
    var timer = Timer()
    var maxProgress = 30
    @Published var progress = 0
    @Published var timeRemaining = 30
    
    var myPoints: Int = 0
    
    init() {
        self.start()
    }
    
    
    func verifyMyAnswer(selectedOption: QuizOption) {
        
        for index in model.quizModel.options.indices {
            model.quizModel.options[index].isCorrect = false
            model.quizModel.options[index].isSelected = false
        }
        
        if let index = model.quizModel.options.firstIndex(where: { $0.optionId == selectedOption.optionId} ) {
            if selectedOption.optionId == model.quizModel.answer { // If the user selected the right answer
                model.quizModel.options[index].isCorrect = true
                model.quizModel.options[index].isSelected = true
                myPoints += 5 // ------ To write the code to add points
                
            } else {
                model.quizModel.options[index].isCorrect = false
                model.quizModel.options[index].isSelected = true
                // ------- To write the code to show the right answer
                
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if (QuizManagerVM.currentIndex < 2) {
                    QuizManagerVM.currentIndex = QuizManagerVM.currentIndex + 1 // Next question
                    self.model = QuizManagerVM.createQuizModel(i: QuizManagerVM.currentIndex)
                } else {
                    self.model.isCompleted = true
                    self.model.winningStatus = true
                    self.reset()
                }
            }
            
        }
        
    }
    
    func restartQuiz() {
        QuizManagerVM.currentIndex = 0
        model = QuizManagerVM.createQuizModel(i: QuizManagerVM.currentIndex)
    }
    
//    var timer = Timer()
//    var maxProgress = 30
//    @Published var progress = 0    timeRemaining = 30
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { time in
            if self.progress == self.maxProgress {
                self.model.isCompleted = true
                self.model.winningStatus = false
                self.reset()
            } else {
                self.progress += 1
                self.timeRemaining -= 1
            }
        } )
    }
    
    func reset() {
        timer.invalidate()
        self.progress = 0
        self.timeRemaining = 30
    }
    
}

extension QuizManagerVM {
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Combien d'alphabets sont utilisés en japonais ?",
                      answer: "B",
                      options: [QuizOption(id: 11, optionId: "A", option: "2", color: Color.yellow),
                                QuizOption(id: 12, optionId: "B", option: "3", color: Color.red),
                                QuizOption(id: 13, optionId: "C", option: "4", color: Color.green),
                                QuizOption(id: 14, optionId: "D", option: "1", color: Color.purple)]),
            
            QuizModel(question: "Quelle religion est la plus ancienne au Japon ?",
                      answer: "D",
                      options: [QuizOption(id: 21, optionId: "A", option: "Catholicisme", color: Color.yellow),
                                QuizOption(id: 22, optionId: "B", option: "Bouddhisme", color: Color.red),
                                QuizOption(id: 23, optionId: "C", option: "Hindouisme", color: Color.green),
                                QuizOption(id: 24, optionId: "D", option: "Shintoïsme", color: Color.purple)]),
            
            QuizModel(question: "Quelles villes a la même latitude que Tokyo?",
                      answer: "A",
                      options: [QuizOption(id: 31, optionId: "A", option: "Athènes", color: Color.yellow),
                                QuizOption(id: 32, optionId: "B", option: "Rome", color: Color.red),
                                QuizOption(id: 33, optionId: "C", option: "Marseille", color: Color.green),
                                QuizOption(id: 34, optionId: "D", option: "Paris", color: Color.purple)])
        ]
    }
}
