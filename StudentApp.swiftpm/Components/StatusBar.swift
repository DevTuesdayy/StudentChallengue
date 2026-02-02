//
//  StatusBar.swift
//  StudentApp
//
//  Created by Emanuel Perez Altuzar on 29/01/26.
//

import SwiftUI

struct StatusBar: View {
    let label: String
    let value: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(label)
                Spacer()
                Text(value > 0.66 ? "Alto" : value > 0.33 ? "Medio" : "Bajo")
                    .foregroundColor(.secondary)
            }

            ProgressView(value: value)
                .tint(Color.green)
        }
    }
}

