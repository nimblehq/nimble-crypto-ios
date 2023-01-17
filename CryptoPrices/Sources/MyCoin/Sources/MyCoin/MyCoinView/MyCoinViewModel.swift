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
    @Published public private(set) var isSuccess = false

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

    public func fetchChartPricesData(id: String, timeFrameItem: TimeFrameItem) async {
        do {
            let dataPoints = try await getChartPricesUseCase.execute(coinID: id, filter: timeFrameItem.timeFrame)
            chartData = dataPoints.map { ChartDataPointUIModel(dataPoint: $0) }
            isSuccess = true
        } catch {
            isSuccess = false
            // TODO: Handle errors
        }
    }

    public func fetchData(id: String, timeFrameItem: TimeFrameItem) async {
        await withTaskGroup(of: Void.self) { taskGroup in
            taskGroup.addTask { await self.fetchCoinDetail(id: id) }
            taskGroup.addTask { await self.fetchChartPricesData(id: id, timeFrameItem: timeFrameItem) }
        }
    }
}
