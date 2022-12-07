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
                homeTitle
                WalletStatisticSection()
            }
        }
        .padding(.top, 24.0)
        .clipped(antialiased: false)
        .frame(maxHeight: .infinity)
    }

    var homeTitle: some View {
        Text(Strings.Home.titleText)
            .multilineTextAlignment(.center)
            .font(.Inter.bold.font(for: .title2))
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
