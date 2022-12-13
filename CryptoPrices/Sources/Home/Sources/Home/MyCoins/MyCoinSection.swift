//
//  MyCoinSection.swift
//
//  Created by Khanh on 12/12/2022.
//

import Styleguide
import SwiftUI

struct MyCoinSection: View {

    var body: some View {
        VStack {
            HStack {
                Text(Strings.Home.myCoinTitle)
                    .foregroundColor(Assets.Colors.titleMedium.swiftUIColor)
                    .font(.Inter.medium.font(for: .callout))
                
                Spacer()
                
                Button(Strings.Home.seeAllText) {}
                    .foregroundColor(Assets.Colors.caribbeanGreen.swiftUIColor)
                    .font(.Inter.medium.font(for: .subheadline))
            }
            .padding(16.0)

            // TODO: - Remove dummy
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<10) {_ in
                        MyCoinItemView()
                            .padding(.trailing, 8.0)
                    }
                }
                .padding(.leading, 16.0)
            }
        }
    }
}

#if DEBUG
struct MyCoinSection_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            MyCoinSection()
        }
    }
}
#endif
