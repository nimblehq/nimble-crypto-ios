//
//  HomeState.swift
//
//  Created by Khanh on 19/12/2022.
//

import Combine
import Entities

public final class HomeState: ObservableObject {

    @Published public var didSelectCoin: String?

    public init() {}
}
