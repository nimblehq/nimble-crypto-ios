//
//  PriceLineChartView.swift
//  MyCoin
//
//  Created by Minh Pham on 04/01/2023.
//
// swiftlint:disable file_types_order

import Charts
import Styleguide
import SwiftUI

struct PriceLineChartView: UIViewRepresentable {

    let entries: [ChartDataEntry]

    let lineChart = LineChartView()

    func makeUIView(context: Context) -> LineChartView {
        lineChart.delegate = context.coordinator
        return lineChart
    }

    func updateUIView(_ uiView: LineChartView, context: Context) {
        let dataSet = LineChartDataSet(entries: entries)
        // TODO: Localize this text for no data case in the integration task
        uiView.noDataText = "No Data"
        uiView.data = LineChartData(dataSet: dataSet)
        uiView.rightAxis.enabled = false
        uiView.leftAxis.enabled = false
        uiView.xAxis.enabled = false
        uiView.legend.enabled = false
        uiView.minOffset = 0.0
        uiView.isUserInteractionEnabled = false

        formatDataSet(dataSet: dataSet)
        uiView.notifyDataSetChanged()
    }

    func makeCoordinator() -> ChartViewCoordinator {
        return ChartViewCoordinator(parent: self)
    }

    private func formatDataSet(dataSet: LineChartDataSet) {
        // Setup line drawing
        dataSet.colors = [Colors.caribbeanGreen.color]
        dataSet.lineWidth = 2.0

        // Handle each data point drawing
        dataSet.drawIconsEnabled = false
        dataSet.drawValuesEnabled = false
        dataSet.drawCirclesEnabled = false

        // Draw gradient fill colors
        let gradientColors = [
            Colors.caribbeanGreen.color.withAlphaComponent(0.5).cgColor,
            Colors.caribbeanGreen.color.withAlphaComponent(0.001).cgColor
        ]
        dataSet.fillAlpha = 1
        if let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil) {
            dataSet.fill = LinearGradientFill(gradient: gradient, angle: -90)
        }
        dataSet.drawFilledEnabled = true
    }
}

class ChartViewCoordinator: NSObject, ChartViewDelegate {

    let parent: PriceLineChartView

    init(parent: PriceLineChartView) {
        self.parent = parent
    }

    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        // TODO: Handle chart data point interactions if needed
        print("Selected price - timestamp \(Int(entry.x)) and price \(Int(entry.y))")
    }
}

#if DEBUG
struct PriceLineChartView_Previews: PreviewProvider {
    
    static var previews: some View {
        PriceLineChartView(entries: [])
    }
}
#endif
