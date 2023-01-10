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

    private let chartData: [ChartDataPointUIModel]

    private var chartDataEntry: [ChartDataEntry] {
        chartData.map { $0.toChartDataEntry() }
    }
    private var maxPrice: Decimal {
        guard let maxDataPoint = chartData.max(by: { $0.price < $1.price })?.price else { return 0.0 }
        return maxDataPoint
    }
    private var minPrice: Decimal {
        guard let minDataPoint = chartData.min(by: { $0.price < $1.price })?.price else { return 0.0 }
        return minDataPoint
    }

    var body: some View {

        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0.0) {
                Text(maxPrice, format: .dollarCurrency)
                    .font(Fonts.Inter.medium.textStyle(.caption))
                    .foregroundColor(Colors.guppieGreen.swiftUIColor)
                    .readSize { textSize in
                        highestPriceOffsetX = calculateDataPointOffsetX(
                            data: chartDataEntry,
                            parentViewWidth: geometry.size.width,
                            labelWidth: textSize.width
                        )
                    }
                    .offset(x: highestPriceOffsetX)
                    .renderIf(!chartData.isEmpty)
                PriceLineChartView(entries: chartDataEntry)
                Text(minPrice, format: .dollarCurrency)
                    .font(Fonts.Inter.medium.textStyle(.caption))
                    .foregroundColor(Colors.carnation.swiftUIColor)
                    .readSize { textSize in
                        lowestPriceOffsetX = calculateDataPointOffsetX(
                            data: chartDataEntry,
                            parentViewWidth: geometry.size.width,
                            labelWidth: textSize.width,
                            isHighest: false
                        )
                    }
                    .offset(x: lowestPriceOffsetX)
                    .renderIf(!chartData.isEmpty)
            }
        }
    }

    init(_ chartData: [ChartDataPointUIModel]) {
        self.chartData = chartData
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
            PriceLineChartSection([])
        }
    }
}
#endif
