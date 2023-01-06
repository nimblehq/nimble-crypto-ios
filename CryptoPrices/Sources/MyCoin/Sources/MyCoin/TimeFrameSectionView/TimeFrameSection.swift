//
//  TimeFrameSection.swift
//  MyCoin
//
//  Created by Khanh on 04/01/2023.
//

import Styleguide
import SwiftUI

struct TimeFrameSection: View {
    
    @State private var selected: TimeFrameItem = .init(timeFrame: .oneDay)
    
    private let timeFrameList: [TimeFrameItem] = [
        .init(timeFrame: .oneDay),
        .init(timeFrame: .oneWeek),
        .init(timeFrame: .oneMonth),
        .init(timeFrame: .oneYear),
        .init(timeFrame: .fiveYears)
    ]

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                ForEach(timeFrameList) { item in
                    Button(item.title) {
                        // TODO: - handling loading chart logic
                        selected = TimeFrameItem(timeFrame: item.timeFrame)
                    }
                    .frame(width: 46.0, height: 32.0)
                    .foregroundColor(
                        selected == TimeFrameItem(timeFrame: item.timeFrame)
                        ? .white
                        : Colors.osloGray.swiftUIColor
                    )
                    .background(
                        selected == TimeFrameItem(timeFrame: item.timeFrame)
                        ? Colors.caribbeanGreen.swiftUIColor
                        : .clear
                    )
                    .cornerRadius(12.0)
                    .padding(.horizontal, 6.0)
                }
            }
            .padding(.horizontal, 40.0)
            .padding(.vertical, 24.0)
        }
    }
}

#if DEBUG
struct TimeFrameSection_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            TimeFrameSection()
        }
    }
}
#endif
