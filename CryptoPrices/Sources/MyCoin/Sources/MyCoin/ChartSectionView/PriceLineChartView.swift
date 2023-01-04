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
        uiView.noDataText = "No Data"
        uiView.data = LineChartData(dataSet: dataSet)
        uiView.rightAxis.enabled = false
        if uiView.scaleX == 1.0 {
            uiView.zoom(scaleX: 1.5, scaleY: 1, x: 0, y: 0)
        }
        formatDataSet(dataSet: dataSet)
        formatLeftAxis(leftAxis: uiView.leftAxis)
        formatXAxis(xAxis: uiView.xAxis)
        formatLegend(legend: uiView.legend)
        uiView.notifyDataSetChanged()
    }

    func makeCoordinator() -> ChartViewCoordinator {
        return ChartViewCoordinator(parent: self)
    }

    func formatDataSet(dataSet: LineChartDataSet) {
        dataSet.colors = [Colors.caribbeanGreen.color]
        dataSet.valueColors = [Colors.caribbeanGreen.color]
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        dataSet.valueFormatter = DefaultValueFormatter(formatter: formatter)
        dataSet.lineWidth = 2.0

        // Handle each data point drawing
        dataSet.drawIconsEnabled = false
        dataSet.drawCircleHoleEnabled = false

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

    func formatLeftAxis(leftAxis: YAxis) {
        leftAxis.labelTextColor = .red
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: formatter)
        leftAxis.axisMinimum = 0
        leftAxis.drawAxisLineEnabled = false
        leftAxis.drawGridLinesEnabled = false
        leftAxis.drawLabelsEnabled = false
    }

    func formatXAxis(xAxis: XAxis) {
        xAxis.valueFormatter = IndexAxisValueFormatter(values: [])
        xAxis.labelPosition = .bottom
        xAxis.drawAxisLineEnabled = false
        xAxis.drawGridLinesEnabled = false
        xAxis.labelTextColor = .red
    }

    func formatLegend(legend: Legend) {
        legend.form = .line
        legend.enabled = false
    }
}

class ChartViewCoordinator: NSObject, ChartViewDelegate {

    let parent: PriceLineChartView

    init(parent: PriceLineChartView) {
        self.parent = parent
    }

    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print("Selected price - timestamp \(Int(entry.x)) and price \(Int(entry.y))")
    }
}

struct PriceLineChartView_Previews: PreviewProvider {
    static var previews: some View {
        PriceLineChartView(entries: [])
    }
}
