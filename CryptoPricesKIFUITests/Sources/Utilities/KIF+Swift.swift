//
//  KIF+Swift.swift
//  CryptoPricesKIFUITests
//
//  Created by Bliss on 10/1/23.
//

import KIF

extension XCTestCase {

    func tester(file: String = #file, _ line: Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }

    func system(file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}
