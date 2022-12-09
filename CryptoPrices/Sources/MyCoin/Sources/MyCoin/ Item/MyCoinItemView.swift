//
//  MyCoinItemView.swift
//
//  Created by Khanh on 07/12/2022.
//

import Styleguide
import SwiftUI

struct MyCoinItemView: View {

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image("ic_bitcoin")
                        .frame(width: 40.0, height: 40.0)
                        .background(.red)
                        .clipShape(Circle())

                    // TODO: - Remove dummy
                    VStack(alignment: .leading) {
                        Text("BTC")
                            .font(.Inter.bold.font(for: .callout))
                            .foregroundColor(.mirage)
                            .padding(.bottom, 4.0)

                        Text("Bitcoin")
                            .font(.Inter.medium.font(for: .subheadline))
                            .foregroundColor(.paleSky)
                    }
                    
                    Spacer()
                }
                
                HStack {
                    // TODO: - Remove dummy
                    Text("$24,209")
                        .font(.Inter.bold.font(for: .callout))
                        .foregroundColor(.mirage)

                    Spacer()

                    Image("ic_arrow_down_red")
                    Text("BTC")
                        .font(.Inter.bold.font(for: .callout))
                        .foregroundColor(.carnation)
                }
            }
            .padding(8.0)
        }
        .frame(width: 180.0, height: 114.0)
        .background(.black)
        .cornerRadius(12.0)
    }
}

#if DEBUG
struct MyCoinItemView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            MyCoinItemView()
        }
    }
}
#endif
