//
//  StudentApp.swift
//  StudentApp
//
//  Created by Emanuel Perez Altuzar on 27/01/26.
//

import SwiftUI

@main
struct StudentAppApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
private struct RootView: View {
    @State private var didStart = false

    var body: some View {
        NavigationStack {
            Group {
                if didStart {
                    TreeDashboardView()
                } else {
                    WelcomeView(onStart: { didStart = true })
                }
            }
        }
    }
}

