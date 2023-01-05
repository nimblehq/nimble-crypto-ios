//
//  Header.swift
//  Home
//
//  Created by Doan Thieu on 05/01/2023.
//

import Styleguide
import SwiftUI

struct Header: View {

    let title: String
    let actionTitle: String
    let action: () -> Void

    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Colors.titleMedium.swiftUIColor)
                .font(Fonts.Inter.medium.textStyle(.callout))

            Spacer()

            Button(actionTitle, action: action)
                .buttonStyle(.borderless)
                .foregroundColor(Colors.caribbeanGreen.swiftUIColor)
                .font(Fonts.Inter.medium.textStyle(.subheadline))
        }
        .padding(16.0)
    }
}
