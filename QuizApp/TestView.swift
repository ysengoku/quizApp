//
//  TestView.swift
//  QuizApp
//
//  Created by apprenant71 on 25/06/2023.
//

import SwiftUI

struct TestView: View {

    
    var body: some View {
        ZStack {
            
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .ignoresSafeArea()
            
            LinearGradient(colors: [.white.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 8) {
                
                Spacer()
                
                Text("BRAVO !")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(Color("Sapphire"))
                
                Text("Merci d'avoir particié au quiz.")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.black.opacity(0.8))
                    .lineLimit(3)
                    .frame(width: UIScreen.main.bounds.size.width - 24, height: 80, alignment: .center)
                    .multilineTextAlignment(.center)

                
//                Spacer()
                
                Button {
                    //
                } label: {
                    Text("Retourner à mon profil")
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
        
    }

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
