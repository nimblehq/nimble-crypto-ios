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
    case myCoins
    case trendingCoins
    case coinDetail
}

extension CoinRoute: Route {

    // TODO: Update when implement
    // swiftlint:disable:next force_unwrapping
    public var baseURL: URL { .init(string: "https://api.coingecko.com/api/v3")! }
    public var path: String { "" }
    public var httpMethod: HttpMethod { .get }
    public var httpHeaders: HttpHeaders { .empty }
    public var parameters: Parameters? { nil }
    public var parameterEncoding: ParameterEncoding? { .json }
}
