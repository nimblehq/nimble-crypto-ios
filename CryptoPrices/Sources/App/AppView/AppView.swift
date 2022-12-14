//
//  ContentView.swift
//  CryptoPrices
//
//  Created by Doan Thieu on 28/11/2022.
//

import Factory
import Home
import MyCoin
import SwiftUI

struct AppView: View {

    @StateObject private var appCoordinator: AppCoordinator = .init()
    @Injected(Container.homeViewModel) private var homeViewModel
    @Injected(Container.myCoinViewModel) private var myCoinViewModel
    @State private var showingMyCoin = false

    var body: some View {
        NavigationView {
            ZStack {
                HomeView(viewModel: homeViewModel)
                    .environmentObject(appCoordinator.homeState)
                NavigationLink("", isActive: $showingMyCoin) {
                    if let myCoinState = appCoordinator.myCoinState {
                        MyCoinView(viewModel: myCoinViewModel)
                            .environmentObject(myCoinState)
                    }
                }
                .labelsHidden()
            }
        }
        .onReceive(appCoordinator.$myCoinState) {
            showingMyCoin = $0 != nil
        }
    }
}
