//
//  Data+decoded.swift
//  Data
//
//  Created by Doan Thieu on 09/12/2022.
//

import Foundation

public extension Data {

    func decoded<T: Decodable>(decoder: JSONDecoder = .apiDecoder) -> T {
        guard let object = try? decoder.decode(T.self, from: self) else { fatalError("Unable to decode \(T.self)") }
        return object
    }
}
