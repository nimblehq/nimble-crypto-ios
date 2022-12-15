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
                Text(Strings.Home.MyCoin.title)
                    .foregroundColor(Colors.titleMedium.swiftUIColor)
                    .font(Fonts.Inter.medium.textStyle(.callout))

                Spacer()
                
                Button(Strings.Home.SeeAll.text) {}
                    .foregroundColor(Colors.caribbeanGreen.swiftUIColor)
                    .font(Fonts.Inter.medium.textStyle(.subheadline))
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
