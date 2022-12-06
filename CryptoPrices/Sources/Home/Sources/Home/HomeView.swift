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
            Text(Strings.Home.titleText)
                .multilineTextAlignment(.center)
                .font(.Inter.bold.font(for: .title2))
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
