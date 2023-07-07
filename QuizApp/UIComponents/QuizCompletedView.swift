//
//  QuizCompletedView.swift
//  QuizApp
//
//  Created by apprenant71 on 25/06/2023.
//

import Foundation
import SwiftUI

//struct FacesGeometryEffect : GeometryEffect {
//    var time : Double
//    var speed = Double.random(in: 100 ... 400)
//    var xDirection = Double.random(in:  -0.05 ... 0.05)
//    var yDirection = Double.random(in: -Double.pi ...  0)
//    
//    var animatableData: Double {
//        get { time }
//        set { time = newValue }
//    }
//    func effectValue(size: CGSize) -> ProjectionTransform {
//        let xTranslation = speed * xDirection
//        let yTranslation = speed * sin(yDirection) * time
//        let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
//        return ProjectionTransform(affineTranslation)
//    }
//}
//
//
//struct FaceMovementModifier: ViewModifier {
//    @State var time = 0.0
//    let duration = 3.0
//    
//    func body(content: Content) -> some View {
//        ZStack {
//            content
//                .modifier(FacesGeometryEffect(time: time))
//                .opacity(time == 3 ? 0 : 1)
//        }
//        .onAppear {
//            withAnimation (.easeOut(duration: duration)) {
//                self.time = duration
//            }
//        }
//    }
//}

struct QuizCompletedView: View {
    
    var quizManagerVM: QuizManagerVM
    
    @State var bravo = false

    
    var body: some View {
        
        VStack(spacing: 8) {
            
            Spacer()
            
            if (quizManagerVM.model.winningStatus) {
                // If the user complete all the question in time
                
                ZStack {
                    
                    ConfettiAnimationView()
                    
                    VStack {
                        Text("BRAVO !")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(Color("Sapphire"))
                        
                        Text("Vous avez obtenu")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color("Sapphire"))
                        
                        Text("\(quizManagerVM.myPoints) points !")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color("Sapphire"))
                        
                        Text("Merci d'avoir particié au quiz.")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black.opacity(0.8))
                            .lineLimit(3)
                            .frame(width: UIScreen.main.bounds.size.width - 24, height: 80, alignment: .center)
                            .multilineTextAlignment(.center)
                        
                    }
                }
                
            } else {
                // If time over
                
                Text("GAME OVER")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.red)
                
                FaceAnimationView()
                                
                Text("Bonne chance pour la prochaine fois.")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.black.opacity(0.8))
                    .lineLimit(3)
                    .frame(width: UIScreen.main.bounds.size.width - 24, height: 80, alignment: .center)
                    .multilineTextAlignment(.center)
                
            }
            
            
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

