// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import Foundation
import NetworkCore

public class MockCoinAPIProtocol: CoinAPIProtocol {

    public init() {}


    //MARK: - myCoins

    public var myCoinsThrowableError: Error?
    public var myCoinsCallsCount = 0
    public var myCoinsCalled: Bool {
        return myCoinsCallsCount > 0
    }
    public var myCoinsReturnValue: [APICoin]!
    public var myCoinsClosure: (() async throws -> [APICoin])?

    public func myCoins() async throws -> [APICoin] {
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
    public var trendingCoinsCoinIDsReturnValue: [APICoin]!
    public var trendingCoinsCoinIDsClosure: (([String]) async throws -> [APICoin])?

    public func trendingCoins(coinIDs: [String]) async throws -> [APICoin] {
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
    public var coinDetailReturnValue: APICoin!
    public var coinDetailClosure: (() async throws -> APICoin)?

    public func coinDetail() async throws -> APICoin {
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
