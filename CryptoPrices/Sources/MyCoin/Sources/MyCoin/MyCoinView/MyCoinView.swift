//  MyCoinView.swift
//  MyCoin
//
//  Created by Mike Pham on 04/12/2022.
//

import Styleguide
import SwiftUI

public struct MyCoinView: View {

    @EnvironmentObject var myCoinState: MyCoinState

    public var body: some View {
        contentView
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton, trailing: likeButton)
            .navigationTitle("Ethereum") // TODO: Remove dummy
            .navigationBarTitleDisplayMode(.inline)
    }

    public init() {}
}

private extension MyCoinView {

    var contentView: some View {
        ScrollView {
            CurrentPriceSection()
        }
        .clipped(antialiased: false)
        .frame(maxHeight: .infinity)
        .background(Colors.bgMain.swiftUIColor)
    }

    var backButton: some View {
        Button {
            myCoinState.didSelectBack = true
        } label: {
            Images.icBack.swiftUIImage
        }
    }

    var likeButton: some View {
        Images.icHeart.swiftUIImage
    }
}

#if DEBUG
struct MyCoinView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            MyCoinView()
        }
    }
}
#endif
