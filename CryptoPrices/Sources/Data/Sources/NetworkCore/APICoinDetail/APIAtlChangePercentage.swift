//
//  APIAtlChangePercentage.swift
//
//  Created by Khanh on 28/12/2022.
//

import Entities

public struct APIAtlChangePercentage: AtlChangePercentage, Decodable, Equatable {

    public let usd: Double
}
