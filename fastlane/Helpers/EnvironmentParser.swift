//
//  EnvironmentParser.swift
//  FastlaneRunner
//
//  Created by by Mike Pham on 29/11/2022.
//  Copyright © 2022 Nimble. All rights reserved.
//

import Foundation

enum EnvironmentParser {

    static func bool(key: String) -> Bool {
        string(key: key) == "true"
    }

    static func string(key: String) -> String {
        environmentVariable(get: .userDefined(key))
    }
}
