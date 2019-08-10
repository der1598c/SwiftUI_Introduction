//
//  TipViewModel.swift
//  HelloSwiftUI
//
//  Created by cata on 8/11/19.
//  Copyright © 2019 cata. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class TipViewModel: ObservableObject {
    
    var total: String = ""
    
    @Published
    var tip: Double = 0.0
    
    func calculateTip() {
        self.tip = (Double(self.total))! * 0.20
    }
}
