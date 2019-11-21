//
//  Landscape.swift
//  Grid-Demo
//
//  Created by cata on 8/25/19.
//  Copyright © 2019 Naila Sheikh. All rights reserved.
//

import Foundation
import SwiftUI

struct Landscape: Identifiable {
    
    let id = UUID()
    let name: String
    let description: String
    let imageURL: String
    
}


extension Landscape {
    static func all() -> [Landscape] {
        return [
            Landscape(name: "Yamashita Park", description: "Yamashita Park (山下公園 Yamashita Kōen) is a public park in Naka Ward, Yokohama, Japan, famous for its waterfront views of the Port of Yokohama.", imageURL: "pic1"),
            Landscape(name: "Osaka Castle", description: "Osaka Castle (大坂城 or 大阪城, Ōsaka-jō) is a Japanese castle in Chūō-ku, Osaka, Japan. The castle is one of Japan's most famous landmarks and it played a major role in the unification of Japan during the sixteenth century of the Azuchi-Momoyama period.[1]in the morning.", imageURL: "pic2"),
            Landscape(name: "Qixingtan Beach", description: "The Qixingtan Beach or Chihsingtan Beach (Chinese: 七星潭海邊; pinyin: Qīxīngtán Hǎibiān) is a beach in Xincheng Township, Hualien County, Taiwan facing the Pacific Ocean.", imageURL: "pic3"),
            Landscape(name: "Taroko National Park", description: "Taroko National Park (Chinese: 太魯閣國家公園; pinyin: Tàilǔgé Gúojiā Gōngyuán; Pe̍h-ōe-jī: Thài-ló͘-koh Kok-ka Kong-hn̂g) is one of the nine national parks in Taiwan and was named after the Taroko Gorge, the landmark gorge of the park carved by the Liwu River. The park spans Taichung Municipality, Nantou County, and Hualien County.", imageURL: "pic4")
        ]
    }
}
