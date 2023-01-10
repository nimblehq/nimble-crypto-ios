//
//  MyCoinViewModel.swift
//  MyCoin
//
//  Created by Khanh on 02/01/2023.
//

import Foundation
import UseCaseProtocol

@MainActor public final class MyCoinViewModel: ObservableObject {

    private let coinDetailUseCase: CoinDetailUseCaseProtocol
    private let getChartPricesUseCase: GetChartPricesUseCaseProtocol

    @Published public private(set) var coinDetail: CoinDetailItem?
    @Published public private(set) var chartData: [ChartDataPointUIModel] = []

    public init(
        coinDetailUseCase: CoinDetailUseCaseProtocol,
        getChartPricesUseCase: GetChartPricesUseCaseProtocol
    ) {
        self.coinDetailUseCase = coinDetailUseCase
        self.getChartPricesUseCase = getChartPricesUseCase
    }

    public func fetchCoinDetail(id: String) async {
        do {
            let coin = try await coinDetailUseCase.execute(id: id)
            coinDetail = CoinDetailItem(coinDetail: coin)
        } catch {
            // TODO: Handle errors
        }
    }

    // TODO: Support different filters
    public func fetchChartPricesData(id: String) async {
        do {
            let dataPoints = try await getChartPricesUseCase.execute(coinID: id, filter: .oneDay)
            chartData = dataPoints.map { ChartDataPointUIModel(dataPoint: $0) }
        } catch {
            // TODO: Handle errors
        }
    }
}
