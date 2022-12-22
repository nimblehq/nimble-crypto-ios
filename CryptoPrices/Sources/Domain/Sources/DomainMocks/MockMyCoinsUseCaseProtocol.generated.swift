// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import Foundation
import UseCaseProtocol
import Entities

public class MockMyCoinsUseCaseProtocol: MyCoinsUseCaseProtocol {

    public init() {}


    //MARK: - execute

    public var executeThrowableError: Error?
    public var executeCallsCount = 0
    public var executeCalled: Bool {
        return executeCallsCount > 0
    }
    public var executeReturnValue: [Coin]!
    public var executeClosure: (() async throws -> [Coin])?

    public func execute() async throws -> [Coin] {
        if let error = executeThrowableError {
            throw error
        }
        executeCallsCount += 1
        if let executeClosure = executeClosure {
            return try await executeClosure()
        } else {
            return executeReturnValue
        }
    }

}
