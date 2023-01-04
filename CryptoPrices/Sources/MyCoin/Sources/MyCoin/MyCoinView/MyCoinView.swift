//  MyCoinView.swift
//  MyCoin
//
//  Created by Mike Pham on 04/12/2022.
//

import Styleguide
import SwiftUI

public struct MyCoinView: View {

    @EnvironmentObject var myCoinState: MyCoinState

    public var body: some View {
        contentView
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: backButton, trailing: likeButton)
            .navigationTitle(viewModel.coinDetail?.name ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        // Handle swipe left-to-right
                        if value.startLocation.x < 20.0 && value.translation.width > 50.0 {
                            myCoinState.didSelectBack = true
                        }
                    }
            )
            .task {
                await viewModel.fetchCoinDetail(id: myCoinState.id)
            }

    }

    @ObservedObject private var viewModel: MyCoinViewModel

    public init(viewModel: MyCoinViewModel) {
        self.viewModel = viewModel
    }
}

private extension MyCoinView {

    var contentView: some View {
        ScrollView {
            CurrentPriceSection()
            Spacer(minLength: 38.0)
            ChartSection()
                .frame(height: 196.0)
            // TODO: - Add time filter here
            // TODO: - Remove dummy
            CoinStatisticsSection(
                coinDetailItem: CoinDetailItem(
                    coinDetail: MockCoinDetail.single
                )
            )
        }
        .clipped(antialiased: false)
        .frame(maxHeight: .infinity)
        .background(Colors.bgMain.swiftUIColor)
    }

    var backButton: some View {
        Button {
            myCoinState.didSelectBack = true
        } label: {
            Images.icBack.swiftUIImage
        }
    }

    var likeButton: some View {
        Images.icHeart.swiftUIImage
    }
}

#if DEBUG
import DomainTestHelpers
import UseCaseProtocol

struct MyCoinView_Previews: PreviewProvider {

    static var previews: some View {
        Preview {
            MyCoinView(
                viewModel: MyCoinViewModel(
                    coinDetailUseCase: MockCoinDetailUseCaseProtocol()
                )
            )
        }
    }
}
#endif
