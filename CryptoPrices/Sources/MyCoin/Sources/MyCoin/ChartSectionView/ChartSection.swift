//
//  ChartSection.swift
//  MyCoin
//
//  Created by Minh Pham on 04/01/2023.
//

import Charts
import Styleguide
import SwiftUI

struct ChartSection: View {

    var body: some View {

        // TODO: Update with real data in backend task
        // swiftlint:disable number_separator
        PriceLineChartView(
            entries: [
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
        )
    }
}

#if DEBUG
struct ChartSection_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            ChartSection()
        }
    }
}
#endif
