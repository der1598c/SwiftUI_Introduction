//
//  StarViewRepresentation.swift
//  MoviesApp
//
//  Created by Leyee.H on 2019/11/20.
//  Copyright © 2019 Leyee. All rights reserved.
//

import Foundation
import SwiftUI

struct StarViewRepresentation: UIViewRepresentable {
    
    @Binding var selected: Bool
    
    typealias UIViewType = StarView
    
    func makeUIView(context: UIViewRepresentableContext<StarViewRepresentation>) -> StarView {
        let starView = StarView()
        return starView
    }
    
    func updateUIView(_ uiView: StarView, context: UIViewRepresentableContext<StarViewRepresentation>) {
        uiView.selected = self.selected
    }
    
}
