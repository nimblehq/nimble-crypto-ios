//  HomeView.swift
//  Home
//
//  Created by Doan Thieu on 04/12/2022.
//

// swiftlint:disable type_contents_order

import Styleguide
import SwiftUI

public struct HomeView: View {

    public init() {}

    public var body: some View {
        // TODO: Implement later
        Text("Home")
            .font(.system(size: 28.0))
            .fontWeight(.medium)
    }
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
