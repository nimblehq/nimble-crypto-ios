//
//  PriceLineChartSection.swift
//  MyCoin
//
//  Created by Minh Pham on 04/01/2023.
//

import Charts
import Styleguide
import SwiftUI

struct PriceLineChartSection: View {

    @State private var highestPriceOffsetX: CGFloat = 0.0
    @State private var lowestPriceOffsetX: CGFloat = 0.0

    // TODO: Update to use real data in the integrate task
    // swiftlint:disable number_separator
    let testData = [
        ChartDataEntry(x: 1640649600000, y: 50774.067814743),
        ChartDataEntry(x: 1640736000000, y: 47725.14804631933),
        ChartDataEntry(x: 1640822400000, y: 46506.99464767938),
        ChartDataEntry(x: 1640908800000, y: 47191.86838983951),
        ChartDataEntry(x: 1640995200000, y: 46319.65108805251),
        ChartDataEntry(x: 1641081600000, y: 47816.07767640849),
        ChartDataEntry(x: 1641168000000, y: 47387.212167697246),
        ChartDataEntry(x: 1641254400000, y: 46531.140860530526),
        ChartDataEntry(x: 1641340800000, y: 45938.02427172366),
        ChartDataEntry(x: 1641427200000, y: 43647.147508068054)
    ]

    var body: some View {

        // TODO: Update to use real data in the integrate task
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0.0) {
                Text("$50,774.06")
                    .font(Fonts.Inter.medium.textStyle(.caption))
                    .foregroundColor(Colors.guppieGreen.swiftUIColor)
                    .readSize { textSize in
                        highestPriceOffsetX = calculateDataPointOffsetX(
                            data: testData,
                            parentViewWidth: geometry.size.width,
                            labelWidth: textSize.width
                        )
                    }
                    .offset(x: highestPriceOffsetX)
                PriceLineChartView(entries: testData)
                Text("$43,647.14")
                    .font(Fonts.Inter.medium.textStyle(.caption))
                    .foregroundColor(Colors.carnation.swiftUIColor)
                    .readSize { textSize in
                        lowestPriceOffsetX = calculateDataPointOffsetX(
                            data: testData,
                            parentViewWidth: geometry.size.width,
                            labelWidth: textSize.width,
                            isHighest: false
                        )
                    }
                    .offset(x: lowestPriceOffsetX)
            }
        }
    }
}

private extension PriceLineChartSection {

    func calculateDataPointOffsetX(
        data: [ChartDataEntry],
        parentViewWidth: CGFloat,
        labelWidth: CGFloat,
        isHighest: Bool = true
    ) -> CGFloat {
        var entry: ChartDataEntry?
        if isHighest {
            entry = data.max { $0.y < $1.y }
        } else {
            entry = data.min { $0.y < $1.y }
        }
        guard let finalEntry = entry,
              let index = data.firstIndex(of: finalEntry) else { return 0.0 }
        // All data points from server has the same time interval
        let spaceInterval = parentViewWidth / CGFloat(data.count - 1)
        let positionX = spaceInterval * CGFloat(index)
        let halfParentViewWidth = parentViewWidth / 2.0
        let halfLabelWidth = labelWidth / 2.0
        let horizontalPadding: CGFloat = 8.0

        // Calculate the price label position if it exceeds the trailing/leading of the screen or not
        if positionX + halfLabelWidth + horizontalPadding > parentViewWidth { // Exceed the trailing
            return halfParentViewWidth - halfLabelWidth - horizontalPadding
        } else if positionX - halfLabelWidth - horizontalPadding < 0 { // Exceed the leading
            return -halfParentViewWidth + halfLabelWidth + horizontalPadding
        } else { // Within the screen region
            return positionX - halfParentViewWidth
        }
    }
}

#if DEBUG
struct PriceLineChartSection_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            PriceLineChartSection()
        }
    }
}
#endif
