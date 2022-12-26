//
//  AppState.swift
//  CryptoPrices
//
//  Created by Khanh on 19/12/2022.
//

import Home
import MyCoin

enum AppState {

    case home(HomeState)
    case myCoin(MyCoinState)
}
