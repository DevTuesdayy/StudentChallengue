//  ActionButton.swift
//  StudentApp
//
//  Created by Emanuel Perez Altuzar on 29/01/26.
//

import SwiftUI

struct ActionButton: View {
    let title: String
    let icon: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .font(.title3)

                Text(title)
                    .font(.headline)
            }
            .foregroundColor(.white)
            .padding(.vertical, 14)
            .padding(.horizontal, 22)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 22)
                    .fill(Color.primaryGreen)
            )
            .shadow(color: .black.opacity(0.15), radius: 6, y: 3)
        }
        .buttonStyle(.plain)
    }
}




