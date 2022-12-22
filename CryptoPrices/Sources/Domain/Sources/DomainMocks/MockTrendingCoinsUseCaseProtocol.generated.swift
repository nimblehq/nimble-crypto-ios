// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import Foundation
import UseCaseProtocol
import Entities

public class MockTrendingCoinsUseCaseProtocol: TrendingCoinsUseCaseProtocol {

    public init() {}


    //MARK: - execute

    public var executeCoinIDsThrowableError: Error?
    public var executeCoinIDsCallsCount = 0
    public var executeCoinIDsCalled: Bool {
        return executeCoinIDsCallsCount > 0
    }
    public var executeCoinIDsReceivedCoinIDs: [String]?
    public var executeCoinIDsReceivedInvocations: [[String]] = []
    public var executeCoinIDsReturnValue: [Coin]!
    public var executeCoinIDsClosure: (([String]) async throws -> [Coin])?

    public func execute(coinIDs: [String]) async throws -> [Coin] {
        if let error = executeCoinIDsThrowableError {
            throw error
        }
        executeCoinIDsCallsCount += 1
        executeCoinIDsReceivedCoinIDs = coinIDs
        executeCoinIDsReceivedInvocations.append(coinIDs)
        if let executeCoinIDsClosure = executeCoinIDsClosure {
            return try await executeCoinIDsClosure(coinIDs)
        } else {
            return executeCoinIDsReturnValue
        }
    }

}
