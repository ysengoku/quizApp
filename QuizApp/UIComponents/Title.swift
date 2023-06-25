//
//  Title.swift
//  QuizApp
//
//  Created by apprenant71 on 24/06/2023.
//

import Foundation
import SwiftUI

struct TitleView: View {
    var body: some View {
      
        VStack {
            Text("Quiz")
                .font(.system(size: 28, weight: .bold))
                
                
            Text("Culture générale sur le Japon")
                .font(.system(size: 20, weight: .bold))
                .multilineTextAlignment(.center)
        }
        .foregroundColor(.black.opacity(0.6))
    }
}
