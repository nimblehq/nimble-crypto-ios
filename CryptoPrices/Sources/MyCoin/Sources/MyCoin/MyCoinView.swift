//  MyCoinView.swift
//  MyCoin
//
//  Created by Mike Pham on 04/12/2022.
//

import Styleguide
import SwiftUI

public struct MyCoinView: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    public var body: some View {
        // TODO: Remove dummy
        Text("MyCoin View")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton, trailing: likeButton)
            .navigationTitle("Ethereum")
    }

    public init() {}
}

private extension MyCoinView {

    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
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
