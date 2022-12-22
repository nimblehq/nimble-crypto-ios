//
//  CurrentPriceSection.swift
//  MyCoin
//
//  Created by Minh Pham on 22/12/2022.
//

import Styleguide
import SwiftUI

struct CurrentPriceSection: View {

    var body: some View {
        VStack(spacing: 8.0) {
            // TODO: - Remove dummy
            Images.icEth.swiftUIImage
                .frame(width: 60.0, height: 60.0)
                .clipShape(Circle())

            VStack(spacing: 4.0) {
                // TODO: Remove hard-coded data
                Text(7_273_291, format: .dollarCurrency)
                    .foregroundColor(.white)
                    .font(Fonts.Inter.bold.textStyle(.title2))

                Button(action: {}, label: {
                    HStack {
                        Images.icArrowUpGreen.swiftUIImage
                        Text(2.41, format: .percentage) // TODO: Remove hard-coded data
                    }
                })
            }
        }
        .padding(.vertical, 8.0)
    }
}

#if DEBUG
struct CurrentPriceSection_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            CurrentPriceSection()
        }
    }
}
#endif
