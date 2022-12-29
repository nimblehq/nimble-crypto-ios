//
//  CoinRoute.swift
//  Data
//
//  Created by Doan Thieu on 01/12/2022.
//

import Foundation
import PilotType

public enum CoinRoute {

    // TODO: Update when implement
    case myCoins(MyCoinsParameters)
    case trendingCoins(TrendingCoinsParameters)
    case chart(GetChartPricesParameters)
    case coinDetail(String)
}

extension CoinRoute: Route {

    // swiftlint:disable:next force_unwrapping
    public var baseURL: URL { .init(string: "https://api.coingecko.com/api/v3")! }

    public var path: String {
        switch self {
        case .myCoins, .trendingCoins: return "/coins/markets"
        case let .chart(parameters): return "/coins/\(parameters.id)/market_chart"
        case let .coinDetail(id): return "/coins/\(id)"
        }
    }

    public var httpMethod: HttpMethod { .get }

    public var httpHeaders: HttpHeaders {
        ["Content-Type": "application/json"]
    }

    public var parameters: Parameters? {
        switch self {
        case let .myCoins(parameters): return parameters.encoded()
        case let .trendingCoins(parameters): return parameters.encoded()
        case let .chart(parameters):
            var finalPayload = parameters.encoded()
            // The id is already encapsulated in the URL path so we need to remove it from the payload
            finalPayload.removeValue(forKey: "id")
            return finalPayload
        default: return nil
        }
    }

    public var parameterEncoding: ParameterEncoding? {
        switch self {
        case .myCoins, .chart, .trendingCoins: return .url
            // TODO: Update when implement
        default:
            return nil
        }
    }
}
