//
//  GetChartPricesParameters.swift
//  Data
//
//  Created by Minh Pham on 27/12/2022.
//

public struct GetChartPricesParameters: Parameterable {

    public let id: String
    public let vsCurrency = "usd"
    public let days: String
}
