//
//  TreeDashboard.swift
//  StudentApp
//
//  Created by Emanuel Perez Altuzar on 29/01/26.
//
import SwiftUI

struct TreeDashboardView: View {

    // MARK: - State
    @State private var water: Double = 0.1
    @State private var sun: Double = 0.1
    @State private var environment: Double = 0.1

    @State private var breathing = false
    @State private var pulse = false

    // MARK: - Computed
    var treeHealth: Double {
        (water + sun + environment) / 3
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {

                // MARK: - Title
                VStack(spacing: 8) {
                    Text("This tree reflects\nyour decisions")
                        .font(.system(size: 32, weight: .semibold, design: .serif))
                        .multilineTextAlignment(.center)

                    Text("Interact and see how he responds")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 12)

                // MARK: - Buttons + Tree
                HStack(alignment: .center, spacing: 20) {

                    // MARK: Buttons
                    VStack(spacing: 10) {

                        ActionButton(title: "Water", icon: "drop.fill") {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                                water = min(water + 0.1, 1)
                                pulse = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                pulse = false
                            }
                        }

                        ActionButton(title: "Give sun", icon: "sun.max.fill") {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                                sun = min(sun + 0.1, 1)
                                pulse = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                pulse = false
                            }
                        }

                        ActionButton(title: "Keep", icon: "leaf.fill") {
                            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                                environment = min(environment + 0.1, 1)
                                pulse = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                pulse = false
                            }
                        }
                    }
                    .padding(.leading, 4)

                    // MARK: Tree (ANIMADO)
                    Image(systemName: "tree.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 210, height: 270)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Color.green.opacity(0.75 + treeHealth * 0.65),
                                    Color.green.opacity(0.72 + treeHealth * 0.45)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        // crecimiento visible
                        .scaleEffect(0.65 + treeHealth * 0.35)
                        // respiración constante
                        .scaleEffect(breathing ? 1.03 : 0.97)
                        // pulso al tocar botón
                        .scaleEffect(pulse ? 1.08 : 1.0)
                        .onAppear {
                            withAnimation(
                                .easeInOut(duration: 2.5)
                                    .repeatForever(autoreverses: true)
                            ) {
                                breathing = true
                            }
                        }
                        .shadow(
                            color: Color.green.opacity(35 * treeHealth),
                            radius: 18,
                            y: 8
                        )
                        .animation(.easeInOut(duration: 0.6), value: treeHealth)
                }
                .padding(.vertical, 6)

                // MARK: - Status Card
                VStack(alignment: .leading, spacing: 14) {
                    Text(statusTitle)
                        .font(.headline)

                    Text(statusSubtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    StatusBar(label: "Water", value: water)
                    StatusBar(label: "Sun", value: sun)
                    StatusBar(label: "Around", value: environment)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(26)
                .shadow(color: .black.opacity(0.1), radius: 14, y: 8)
        
                Text("Lack of attention also leaves its mark.")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryGreen.opacity(0.65))
                    .cornerRadius(18)
                    .padding(.top, 8)
            }
            .padding(.horizontal)
        }
        .background(
            Color(red: 0.96, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
        )
    }

  
    private var statusTitle: String {
        treeHealth < 0.3
        ? "The tree begins to weaken."
        : "The tree is growing healthy."
    }

    private var statusSubtitle: String {
        treeHealth < 0.3
        ? "He needs attention."
        : "The balance of the environment strengthens it."
    }
}

#Preview {
    TreeDashboardView()
}
