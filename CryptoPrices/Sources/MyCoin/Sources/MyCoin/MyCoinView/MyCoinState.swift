//
//  MyCoinState.swift
//
//  Created by Khanh on 19/12/2022.
//

import Combine

public final class MyCoinState: ObservableObject {

    @Published public var id: String = ""
    @Published public var didSelectBack = false

    public init(id: String) {
        self.id = id
    }
}
