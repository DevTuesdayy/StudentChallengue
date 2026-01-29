//
//  WelcomeView.swift
//  StudentApp
//
//  Created by Emanuel Perez Altuzar on 27/01/26.
//

import SwiftUI

struct WelcomeView: View {
    
    var onStart: () -> Void = {}
    
    var body: some View {
        ZStack {
            // Fondo degradado
            LinearGradient(
                colors: [
                    Color(red: 0.75, green: 0.9, blue: 0.95),
                    Color(red: 0.75, green: 0.9, blue: 0.75)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Spacer()
                
                // Texto principal
                Text("Nature\ndoesn't speak.")
                    .font(.system(size: 34, weight: .semibold, design: .serif))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.85))
                
                // Texto secundario
                Text("But it responds to what we do.")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.6))
                
                Spacer()
                
                // Botón Entrar
                Button(action: onStart) {
                    Text("Enter")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            Capsule()
                                .fill(Color(red: 0.15, green: 0.45, blue: 0.3))
                        )
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 24)
            }
        }
    }
}

