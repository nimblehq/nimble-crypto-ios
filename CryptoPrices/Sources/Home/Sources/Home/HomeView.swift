//  HomeView.swift
//  Home
//
//  Created by Doan Thieu on 04/12/2022.
//

import Styleguide
import SwiftUI

public struct HomeView: View {

    public var body: some View {
        ScrollView {
            VStack(spacing: 40.0) {
                Text(Strings.Home.titleText)
                    .multilineTextAlignment(.center)
                    .font(.Inter.bold.font(for: .title2))

                ZStack {
                    Rectangle().fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.startGradientJade, .endGradientJade]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(12.0)
                    .frame(height: 212.0)
                    .padding(EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0))
                    .shadow(color: .endGradientJade, radius: 16.0, x: 0.0, y: 16.0)
                }
            }
        }
        .padding(.top, 24.0)
        .clipped(antialiased: false)
        .frame(maxHeight: .infinity)
    }

    public init() {}
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            HomeView()
        }
    }
}
#endif
