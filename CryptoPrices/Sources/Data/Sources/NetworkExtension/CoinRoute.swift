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
    case coinDetail
}

extension CoinRoute: Route {

    // swiftlint:disable:next force_unwrapping
    public var baseURL: URL { .init(string: "https://api.coingecko.com/api/v3")! }

    public var path: String {
        switch self {
        case .myCoins: return "/coins/market"
        case .trendingCoins: return "/coins/markets"
            // TODO: Update when implement
        default: return ""
        }
    }

    public var httpMethod: HttpMethod { .get }
    public var httpHeaders: HttpHeaders { .empty }

    public var parameters: Parameters? {
        switch self {
        case let .myCoins(parameters): return parameters.encoded()
        case let .trendingCoins(parameters): return parameters.encoded()
            // TODO: Update when implement
        default:
            return nil
        }
    }

    public var parameterEncoding: ParameterEncoding? { .json }
}
