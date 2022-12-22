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
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60.0, height: 60.0)
                .clipShape(Circle())

            VStack(spacing: 4.0) {
                // TODO: Remove hard-coded data
                Text(7_273_291, format: .dollarCurrency)
                    .foregroundColor(Colors.textBold.swiftUIColor)
                    .font(Fonts.Inter.semiBold.textStyle(.title))
                    .frame(height: 34.0)

                Button(action: {}, label: {
                    HStack {
                        Images.icArrowUpGreen.swiftUIImage
                        // TODO: Remove hard-coded data
                        Text(2.41, format: .percentage)
                            .font(Fonts.Inter.medium.textStyle(.callout))
                        
                    }
                })
                .padding(EdgeInsets(top: 8.0, leading: 10.0, bottom: 8.0, trailing: 10.0))
                .foregroundColor(Colors.guppieGreen.swiftUIColor)
                .background(Colors.scandal.swiftUIColor)
                .cornerRadius(20.0)
            }
        }
        .padding(.vertical, 8.0)
        .frame(maxWidth: .infinity)
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
