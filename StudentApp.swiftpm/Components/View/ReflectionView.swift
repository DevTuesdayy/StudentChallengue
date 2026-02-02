//
//  Reflection.swift
//  StudentApp
//
//  Created by Emanuel Perez Altuzar on 31/01/26.
//

import SwiftUI

struct ReflectionView: View {

    var body: some View {
        ZStack {

            // MARK: - Background
            LinearGradient(
                colors: [
                    Color(red: 0.78, green: 0.87, blue: 0.74),
                    Color(red: 0.55, green: 0.70, blue: 0.50)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // MARK: - Content
            VStack(spacing: 28) {

                Spacer()

                Text("Detente un momento.")
                    .font(.system(size: 34, weight: .semibold, design: .serif))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)

                Text("Cuidar también implica observar.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white.opacity(0.9))

                Text("La naturaleza no crece con prisa.")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.top, 8)

                Spacer()

                // MARK: - Action
                NavigationLink {
                    TreeDashboardView()
                } label: {
                    Text("Volver al árbol")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 14)
                        .frame(maxWidth: .infinity)
                        .background(Color.primaryGreen)
                        .cornerRadius(20)
                        .padding(.horizontal, 32)
                }

                Spacer(minLength: 40)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ReflectionView()
    }
}

