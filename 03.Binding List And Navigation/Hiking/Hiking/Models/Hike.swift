//
//  Hike.swift
//  Hiking
//
//  Created by cata on 8/11/19.
//  Copyright © 2019 cata. All rights reserved.
//

import Foundation
import SwiftUI

struct Hike: Identifiable {
    
    let id = UUID()
    let name: String
    let imageURL: String
    let location: String
    
}


extension Hike {
    static func all() -> [Hike] {
        return[
            Hike(name: "QixingtanBeach", imageURL: "QixingtanBeach", location: "Qixingtan, Hualien, Taiwan"),
            Hike(name: "QixingtanBeachStarrySky", imageURL: "QixingtanBeachStarrySky", location: "Qixingtan, Hualien, Taiwan"),
            Hike(name: "TarokoRockWall", imageURL: "TarokoRockWall", location: "Taroko National Park, Hualien, Taiwan")
        ]
    }
}
