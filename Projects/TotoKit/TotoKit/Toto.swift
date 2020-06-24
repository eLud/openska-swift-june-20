//
//  Toto.swift
//  TotoKit
//
//  Created by Ludovic Ollagnier on 24/06/2020.
//

import Foundation

public class Toto {

    var key: String

    public init(apiKey: String) {
        self.key = apiKey
    }

    public static func totoify() {

    }

    public func apiKeyIsValid() -> Bool {

        return key.contains("toto")
    }

    public func apiKeyIsInValid() -> Bool {

        return key.contains("toto")
    }
}
