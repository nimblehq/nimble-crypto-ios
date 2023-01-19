//
//  ActivityRingView.swift
//  Styleguide
//
//  Created by Doan Thieu on 18/01/2023.
//

import SwiftUI

public struct CircularProgressView: View {

    private let progress: Double
    private let tint: Color

    public var body: some View {
        Circle()
            .trim(from: 0.0, to: progress)
            .stroke(tint, lineWidth: 4.0)
            .frame(width: 48.0, height: 48.0)
    }

    public init(progress: Double, tint: Color = Colors.tiffanyBlue.swiftUIColor) {
        self.progress = progress
        self.tint = tint
    }
}
