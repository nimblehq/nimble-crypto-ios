//  MyCoinView.swift
//  MyCoin
//
//  Created by Mike Pham on 04/12/2022.
//

import Styleguide
import SwiftUI

public struct MyCoinView: View {

    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<10) {_ in
                    MyCoinItemView()
                }
            }
        }
    }

    public init() {}
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
