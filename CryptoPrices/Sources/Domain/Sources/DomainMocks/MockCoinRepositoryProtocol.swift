// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import Foundation
import RepositoryProtocol
import Entities

public class MockCoinRepositoryProtocol: CoinRepositoryProtocol {

    public init() {}


    //MARK: - myCoins

    public var myCoinsThrowableError: Error?
    public var myCoinsCallsCount = 0
    public var myCoinsCalled: Bool {
        return myCoinsCallsCount > 0
    }
    public var myCoinsReturnValue: [Coin]!
    public var myCoinsClosure: (() async throws -> [Coin])?

    public func myCoins() async throws -> [Coin] {
        if let error = myCoinsThrowableError {
            throw error
        }
        myCoinsCallsCount += 1
        if let myCoinsClosure = myCoinsClosure {
            return try await myCoinsClosure()
        } else {
            return myCoinsReturnValue
        }
    }

    //MARK: - trendingCoins

    public var trendingCoinsCoinIDsThrowableError: Error?
    public var trendingCoinsCoinIDsCallsCount = 0
    public var trendingCoinsCoinIDsCalled: Bool {
        return trendingCoinsCoinIDsCallsCount > 0
    }
    public var trendingCoinsCoinIDsReceivedCoinIDs: [String]?
    public var trendingCoinsCoinIDsReceivedInvocations: [[String]] = []
    public var trendingCoinsCoinIDsReturnValue: [Coin]!
    public var trendingCoinsCoinIDsClosure: (([String]) async throws -> [Coin])?

    public func trendingCoins(coinIDs: [String]) async throws -> [Coin] {
        if let error = trendingCoinsCoinIDsThrowableError {
            throw error
        }
        trendingCoinsCoinIDsCallsCount += 1
        trendingCoinsCoinIDsReceivedCoinIDs = coinIDs
        trendingCoinsCoinIDsReceivedInvocations.append(coinIDs)
        if let trendingCoinsCoinIDsClosure = trendingCoinsCoinIDsClosure {
            return try await trendingCoinsCoinIDsClosure(coinIDs)
        } else {
            return trendingCoinsCoinIDsReturnValue
        }
    }

    //MARK: - coinDetail

    public var coinDetailThrowableError: Error?
    public var coinDetailCallsCount = 0
    public var coinDetailCalled: Bool {
        return coinDetailCallsCount > 0
    }
    public var coinDetailReturnValue: Coin!
    public var coinDetailClosure: (() async throws -> Coin)?

    public func coinDetail() async throws -> Coin {
        if let error = coinDetailThrowableError {
            throw error
        }
        coinDetailCallsCount += 1
        if let coinDetailClosure = coinDetailClosure {
            return try await coinDetailClosure()
        } else {
            return coinDetailReturnValue
        }
    }

}
