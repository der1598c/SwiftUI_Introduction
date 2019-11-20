//
//  ContentView.swift
//  Gesture-Demo
//
//  Created by Leyee.H on 2019/11/21.
//  Copyright © 2019 Leyee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapped: Bool = false
    @State private var cardDragState: CGSize = CGSize.zero
    @State private var cardRotateState: Double = 0
    
    var body: some View {
        
        Card(tapped: self.tapped)
            .animation(.default)
            
            .offset(y: self.cardDragState.height)
            
            .rotationEffect(Angle(degrees: self.cardRotateState))
            
            .gesture(RotationGesture()
                        .onChanged({ value in
                            let degree = value.degrees >= 40 ? 60 : value.degrees
                            self.cardRotateState = degree
                        })
                        .onEnded({ _ in
                            self.cardRotateState = 0
                        })
            )
            
            .gesture(DragGesture()
                        .onChanged({ value in
                            self.cardDragState = value.translation
                        })
                        .onEnded({ _ in
                            self.cardDragState = CGSize.zero
                            self.tapped.toggle()
                        })
            )
            
            .gesture(TapGesture(count: 1)
                        .onEnded({ () in
                            self.tapped.toggle()
                        })
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
