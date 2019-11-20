//
//  Card.swift
//  Gesture-Demo
//
//  Created by Leyee.H on 2019/11/21.
//  Copyright © 2019 Leyee. All rights reserved.
//

import SwiftUI

struct Card: View {
    
    let tapped: Bool
    @State private var scale: CGFloat = 1
    
    var body: some View {
        
        VStack {
            
            Image("SwiftUI")
                .resizable()
                .cornerRadius(16)
                .scaleEffect(self.scale)
                .frame(width: 300, height: 300)
                .gesture(MagnificationGesture()
                            .onChanged({ value in
                                self.scale = value.magnitude
                            })
                            .onEnded({ _ in
                                self.scale = 1
                            })
                )
            
            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .foregroundColor(Color.white)
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(self.tapped ? Color.orange : Color.purple)
        .cornerRadius(30)
        
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(tapped: false)
    }
}
