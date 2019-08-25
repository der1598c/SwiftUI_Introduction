//
//  Array+Extensions.swift
//  Grid-Demo
//
//  Created by cata on 8/22/19.
//  Copyright © 2019 Naila Sheikh. All rights reserved.
//

import Foundation

// https://www.hackingwithswift.com/example-code/language/how-to-split-an-array-into-chunks
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
